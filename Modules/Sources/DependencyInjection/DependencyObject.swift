//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation
import SwiftUI

/// This is property wrapper to provide SwiftUI ObservableObjects
/// E.g.: @DependencyObject(\.messagingState) var messageState
@MainActor @propertyWrapper
public struct DependencyObject<T>: DynamicProperty where T: ObservableObject & Sendable {
    @ObservedObject private var dependency: T

    public init(_ keyPath: KeyPath<DependencyContainer, Factory<T>>) {
        dependency = DI[keyPath: keyPath].resolve()
    }

    public var wrappedValue: T {
        get { dependency }
        mutating set { dependency = newValue }
    }

    public var projectedValue: ObservedObject<T>.Wrapper {
        $dependency
    }
}
