//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

public extension Factory {
    /// Initializes a factory that resolves to a different (fake) type in Xcode previews.
    /// - Parameters:
    ///   - lifetime: the lifetime for the dependency
    ///   - function: Do NOT provide custom value. This is default argument for the context where dependency is defined
    ///   - factoryClosure: the closure where actual dependency is created
    ///   - inPreviews: the closure providing a fake dependency for Xcode previews
    @inlinable
    init(
        lifetime: Lifetime,
        function: String = #function,
        _ factoryClosure: @escaping @Sendable () -> Dependency,
        inPreviews previewsClosure: @escaping @Sendable () -> Dependency
    ) {
        if CurrentBuild.isDebug && CurrentBuild.isXcodePreview {
            self.init(lifetime: lifetime, function: function, factoryClosure: previewsClosure)
        } else {
            self.init(lifetime: lifetime, function: function, factoryClosure: factoryClosure)
        }
    }
}

public extension DependencyContainer {
    /// This is a helper function to register dependency via protocol where the implementation will be provider later,
    /// with a fake resolved in Xcode previews.
    /// - Parameter function: Do NOT provide custom value. This is default argument for the context where dependency is defined
    /// - Returns: Empty factory that will crash the application if the actual dependency implementation isn't provided,
    ///            or alternatively, return a fake one if resolved within an Xcode preview.
    @inlinable
    func promised<Dependency>(function: String = #function, inPreviews previewsClosure: @escaping @Sendable () -> Dependency) -> Factory<Dependency> {
        if CurrentBuild.isDebug {
            return Factory(lifetime: .cached, function: function, factoryClosure: {
                guard CurrentBuild.isXcodePreview else {
                    fatalError("\(Dependency.self) was not registered")
                }
                return previewsClosure()
            })
        } else {
            return promised(function: function)
        }
    }
}
