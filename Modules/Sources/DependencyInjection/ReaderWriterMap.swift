//
//  File.swift
//  WWDC24Modules
//
//  Created by Oleksandr Balabanov on 05/02/2025.
//

import Foundation

/// Thread safe map that allows multiple reads from the map and only one concurrent modification
public final class ReaderWriterMap<K: Hashable, V>: @unchecked Sendable {
    private let concurrentQueue = DispatchQueue(label: "readerWritierMap.queue", attributes: .concurrent)
    private var values = [K: V]()

    public init() {}

    /// Gets value from the map. Multiple reads can happen concurrently
    /// - Parameter key: key for given value
    /// - Returns: value if it is present
    public func value(forKey key: K) -> V? {
        concurrentQueue.sync {
            values[key]
        }
    }

    /// Gets all keys from the map for values matching condition. Multiple reads can happen concurrently
    /// - Parameter isIncluded: condition value has to meet
    /// - Returns: all keys matching condition for values
    public func filteredKeysForValues(isIncluded: (V) -> Bool) -> [K] {
        concurrentQueue.sync {
            values.filter { isIncluded($1) }.map { $0.key }
        }
    }

    /// Sets value in the map.
    /// Only one set or remove can happen concurrently, all reads will wait during modification.
    /// - Parameters:
    ///   - value: value to put in the map
    ///   - key: key for given value
    public func set(value: V, forKey key: K) {
        concurrentQueue.sync(flags: .barrier) {
            values[key] = value
        }
    }

    /// Removes value from the map.
    /// Only one set or remove can happen concurrently, all reads will wait during modification.
    /// - Parameter key: key for value to remove
    @discardableResult
    public func removeValue(forKey key: K) -> V? {
        concurrentQueue.sync(flags: .barrier) {
            values.removeValue(forKey: key)
        }
    }

    /// Removes all entries from the map.
    /// Only one set or remove can happen concurrently, all reads will wait during modification.
    public func removeAll() {
        concurrentQueue.sync(flags: .barrier) {
            values.removeAll()
        }
    }

    public subscript(_ key: K) -> V? {
        get {
            value(forKey: key)
        }
        set {
            if let newValue {
                set(value: newValue, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}
