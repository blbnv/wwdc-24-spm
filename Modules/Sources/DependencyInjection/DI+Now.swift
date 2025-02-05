//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

public extension DependencyContainer {
    var now: Factory<@Sendable () -> Date> {
        Factory(lifetime: .cached) { { Date() } }
    }
}
