//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

/// This is property wrapper used to provide dependency for given object
/// E.g.: @Dependency(\.eventReporter) var eventReporter
@propertyWrapper
public struct Dependency<T: Sendable>: Sendable {
    public var wrappedValue: T

    public init(_ keyPath: KeyPath<DependencyContainer, Factory<T>>) {
        wrappedValue = DI[keyPath: keyPath].resolve()
    }
}
