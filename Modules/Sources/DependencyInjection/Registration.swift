//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

protocol AnyRegistration: Sendable {}

struct Registration<Dependency>: AnyRegistration {
    let lifetime: Lifetime
    let id: String
    let factoryClosure: @Sendable () -> Dependency

    init(lifetime: Lifetime, id: String, factoryClosure: @escaping @Sendable () -> Dependency) {
        self.lifetime = lifetime
        self.id = id
        self.factoryClosure = factoryClosure
    }

    func latestRegistration() -> Registration<Dependency> {
        DI.registrations[id] as? Registration<Dependency> ?? self
    }

    func register(lifetime: Lifetime, _ factoryClosure: @escaping @Sendable () -> Dependency) {
        DI.registrations[id] = Self(lifetime: lifetime, id: id, factoryClosure: factoryClosure)
    }
}
