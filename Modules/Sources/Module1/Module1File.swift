//
//  Module1File.swift
//  
//
//  Created by Oleksandr Balabanov on 31/05/2024.
//

import Foundation
import Module2
import Module3

public final class Foo {
    public static func test() {
        print("App Launch")
        
        let module2 = Module2()
        module2.foo()
        
        Module3.foo()
    }
}
