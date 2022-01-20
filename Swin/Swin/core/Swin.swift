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
    var modules: [Module] = []
    
    func modules(modules: [Module]) {
        self.modules.append(contentsOf: modules)
    }
    
    static func startSwin() -> Swin {
        if(swin == nil) {
            let swin = Swin()
            self.swin = swin
        }
        return swin!
    }
    
    fileprivate static func get<T>(type: T.Type) -> T  {
        guard let _swin = swin else {
            print(RuntimeError("test"))
            exit(0)
        }
        
        var expectedClass: T? = nil
        _swin.modules.forEach { module in
            module.factories.forEach { factory in
                if (factory.clazzType is T.Type) {
                    expectedClass = factory.create(ofType: T.self)
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
    
    fileprivate static func inject<T>(type: T.Type) -> Lazy<T>  {
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

func startSwin(_ declaration: @escaping (Swin) -> ()) {
    let swin = Swin.startSwin()
    declaration(swin)
}

func get<T>(type: T.Type) -> T {
    return Swin.get(type: type)
}

func inject<T>(type: T.Type) -> Lazy<T> {
    return Swin.inject(type: type)
}
