//
//  File.swift
//  
//
//  Created by Oleksandr Balabanov on 05/06/2024.
//

import Foundation
import Apollo

public final class Module2 {
    public init() {}
    public func foo() {
        print("Module2 Apollo version - \(Apollo.Constants.ApolloVersion)")
    }
}
