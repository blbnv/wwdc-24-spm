//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

/// Defines lifetime for given dependency
public enum Lifetime: Sendable {
    /// It will return the same instance each time until a new one will be registered
    case cached
    /// It will return new instance each time
    case alwaysNew
}

/// This type is used to provide dependencies in the `Dependencies` container
public struct Factory<Dependency: Sendable>: Sendable {
    private let id: String
    private let registration: Registration<Dependency>

    /// Initializes Factory
    /// - Parameters:
    ///   - lifetime: the lifetime for the dependnecy
    ///   - function: Do NOT provide custom value. This is default argument for the context where dependency is defined
    ///   - factoryClosure: the closure where actual dependency is created
    public init(lifetime: Lifetime, function: String = #function, factoryClosure: @escaping @Sendable () -> Dependency) {
        let type = String(reflecting: Dependency.self)
        id = "\(function)<\(type)>"
        registration = Registration(lifetime: lifetime, id: id, factoryClosure: factoryClosure)
    }

    /// This is shortcut to provide dependency directly via contaner e.g. `Dependencies.shared.eventReporter()`
    /// - Returns: actual dependency
    public func callAsFunction() -> Dependency {
        resolve()
    }

    /// This is function that provides the dependency from given factory
    /// - Returns: actual dependency
    public func resolve() -> Dependency {
        DI.callInitialRegistrationsIfNeeded()

        let latestRegistration = registration.latestRegistration()
        switch latestRegistration.lifetime {
        case .cached:
            return resolveSingleton(registration: latestRegistration)
        case .alwaysNew:
            return latestRegistration.factoryClosure()
        }
    }

    /// It register new closure for given dependency e.g. new network client after user signs out
    /// - Parameters:
    ///   - scope: the scope for the dependency, if it should e.g. singleton or unique value each time
    ///   - factoryClosure: the closure where actual dependency is created
    public func register(lifetime: Lifetime, _ factoryClosure: @escaping @Sendable () -> Dependency) {
        DI.callInitialRegistrationsIfNeeded()
        defer {
            DI.recursiveLock.unlock()
        }
        DI.recursiveLock.lock()
        /// Keep registration and removing previous value atomic operation
        registration.register(lifetime: lifetime, factoryClosure)
        DI.cache.removeValue(forKey: id)
    }

    private func resolveSingleton(registration: Registration<Dependency>) -> Dependency {
        /// If we have instance already we don't need to enter lock
        if let instance = resolveExistingSingleton() {
            return instance
        }
        /// We use recursive lock here in case of nested dependencies
        defer {
            DI.recursiveLock.unlock()
        }
        DI.recursiveLock.lock()
        /// We have to check again if singleton was not created by another thread when waiting for lock
        if let instance = resolveExistingSingleton() {
            return instance
        }
        /// We know here only one thread will create a new instance
        let instance = registration.factoryClosure()
        let value = (lifetime: registration.lifetime, instance: instance)
        DI.cache.set(value: value, forKey: id)
        return instance
    }

    private func resolveExistingSingleton() -> Dependency? {
        if let cached: Dependency = DI.cache.value(forKey: id)?.instance as? Dependency {
            if let optional = cached as? OptionalProtocol {
                if optional.hasWrappedValue {
                    return cached
                }
            } else {
                return cached
            }
        }
        return nil
    }
}
