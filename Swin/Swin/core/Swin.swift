//
//  Swin.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation
import SwiftUI

class Swin {
    
    static var swin: Swin?
    let modules: [Module]
    
    init(modules: [Module]) {
        self.modules = modules
    }
    
    static func startSwin(modules: [Module]) {
        if(swin == nil) {
            let swin = Swin(modules: modules)
            self.swin = swin
        }
        return
    }
    
    static func get<T>(type: T.Type) -> T  {
        guard let _swin = swin else {
            print(RuntimeError("test"))
            exit(0)
        }
        
        var expectedClass: T? = nil
        _swin.modules.forEach { module in
            module.factories.forEach { factory in
                if (factory.clazzType is T.Type) {
                    expectedClass = factory.definition() as? T
                    return
                }
                return
            }
        }
        
        if (expectedClass == nil) {
            print(RuntimeError("test"))
            exit(0)
        }
        return expectedClass!
    }
    
    static func inject<T>(type: T.Type) -> Lazy<T>  {
        guard let _swin = swin else {
            print(RuntimeError("test"))
            exit(0)
        }
        
        var expectedDefinition: Definition<Any>? = nil
        _swin.modules.forEach { module in
            module.factories.forEach { factory in
                if (factory.clazzType is T.Type) {
                    expectedDefinition = factory.definition
                    return
                }
                return
            }
        }
        
        if (expectedDefinition == nil) {
            print(RuntimeError("test"))
            exit(0)
        }
        return Lazy(initValue: expectedDefinition!)
    }
}

struct Lazy<T> {
    private let initValue: Definition<Any>
    lazy var value: T = {
        initValue() as! T
    }()
    
    init(initValue: @escaping Definition<Any>) {
        self.initValue = initValue
    }
}
