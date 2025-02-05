//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

/// This is protocol that can be used in the main module of the app where all dependencies can be provided.
/// It is important that before providing dependencies all dependencies that were defined with `promised` function
/// will be provided first.
public protocol InitialRegistration {
    /// Register `promised` dependencies in this function
    func registerPromisedDependencies()
}
