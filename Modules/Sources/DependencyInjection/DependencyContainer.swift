//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

public let DI = DependencyContainer.shared

/// This is container class that holds dependencies of the application
/// Newly added dependencies should be registered via this container
public final class DependencyContainer: @unchecked Sendable {
    /// Shared instance of dependencies container
    static let shared = DependencyContainer()
    let cache = ReaderWriterMap<String, (lifetime: Lifetime, instance: Any)>()
    let registrations = ReaderWriterMap<String, AnyRegistration>()
    let recursiveLock = NSRecursiveLock()

    private var didCallInitialRegistrations = false

    private init() {}

    /// This is helper function to register dependency via protocol where the implementation will be provider later
    /// - Parameter function:Do NOT provide custom value. This is default argument for the context where dependnecy is defined
    /// - Returns: Empty @factory that will crash the application the actual dependency implementation won't be provided.
    public func promised<T>(function: String = #function) -> Factory<T> {
        Factory(lifetime: .cached, function: function) {
            fatalError("\(T.self) was not registered")
        }
    }

    public func reset(lifetime: Lifetime) {
        defer {
            recursiveLock.unlock()
        }
        recursiveLock.lock()
        let idsWithScope = cache
            .filteredKeysForValues { $0.lifetime == lifetime }
        for id in idsWithScope {
            cache.removeValue(forKey: id)
        }
    }

    func callInitialRegistrationsIfNeeded() {
        /// If we did call initial registration we don't need to enter lock
        guard !didCallInitialRegistrations else { return }
        defer {
            recursiveLock.unlock()
        }
        recursiveLock.lock()
        /// We have to check again if another thread didn't call initial registration when we were waiting for lock
        if !didCallInitialRegistrations {
            /// We firstly set didCallInitialRegistrations to disallow calling it recursively again
            didCallInitialRegistrations = true
            (self as? InitialRegistration)?.registerPromisedDependencies()
        }
    }
}
