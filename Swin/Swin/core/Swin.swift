//
//  Swin.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation
import SwiftUI

typealias SwinAppDeclaration = (Swin) -> ()

@discardableResult
func startSwin(_ declaration: @escaping SwinAppDeclaration) -> Swin {
    let swin = Swin.startSwin()
    declaration(swin)
    return swin
}

func get<T>(_ type: T.Type, qualifier: Qualifier? = nil) -> T {
    return Swin.get(type: type, qualifier: qualifier)
}

func inject<T>(_ type: T.Type) -> Lazy<T> {
    return Swin.inject(type: type)
}

class Swin {
    private static var swin: Swin?
        
    var modules: [Module] = []
    
    func modules(_ modules: [Module]) {
        self.modules.append(contentsOf: modules)
    }
    
    func start() {
        
    }
    
    func close() {
        modules.forEach { $0.close() }
    }
    
    private func createEagerInstances() {
        
    }
}

extension Swin {
    fileprivate static func startSwin() -> Swin {
        if(swin == nil) {
            let swin = Swin()
            swin.start()
            self.swin = swin
        }
        return swin!
    }
}

extension Swin {
    fileprivate static func get<T>(type: T.Type, qualifier: Qualifier? = nil) -> T  {
        guard let _swin = swin else {
            print(RuntimeError("test"))
            exit(0)
        }
        
        var expectedClass: T? = nil
        for module in _swin.modules {
            expectedClass = module.factories[indexKey(T.self, qualifier: qualifier)]?.create(ofType: T.self)
            if(expectedClass != nil) {
                break
            }
        }
        
        if (expectedClass == nil) {
            assertionFailure("Expeceted class(\(T.self) not found")
            exit(0)
        }
        return expectedClass!
    }
    
    fileprivate static func inject<T>(type: T.Type) -> Lazy<T>  {
        guard let _swin = swin else {
            assertionFailure("Swin instance should be initalized before usage!")
            exit(0)
        }
        
        var expectedDefinition: Definition<Any>? = nil
        for module in _swin.modules {
            expectedDefinition = module.factories[indexKey(T.self, qualifier: nil)]?.beanDefinition.definition
            if(expectedDefinition != nil) {
                break
            }
        }
        
        if (expectedDefinition == nil) {
            assertionFailure("Expeceted class(\(T.self) not found")
            exit(0)
        }
        
        return Lazy { expectedDefinition! }
    }
}
