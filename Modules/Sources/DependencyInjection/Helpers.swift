//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

protocol OptionalProtocol {
    var hasWrappedValue: Bool { get }
    var wrappedValue: Any? { get }
}

extension Optional: OptionalProtocol {
    var hasWrappedValue: Bool {
        wrappedValue != nil
    }

    var wrappedValue: Any? {
        if case let .some(value) = self {
            return value
        }
        return nil
    }
}

/// It replicates the logic from `WNFoundation`'s `BuildInfo` to avoid dependency and keep this module isolated.
public enum CurrentBuild {
    /// `true` iff build with Debug configuration, which should (soon) only be local builds
    public static var isDebug: Bool {
        #if DEBUG
            true
        #else
            false
        #endif
    }

    /// Running for Xcode Previews
    public static var isXcodePreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
