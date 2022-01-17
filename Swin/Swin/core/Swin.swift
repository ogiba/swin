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
                if (factory.clazz is T) {
                    expectedClass = factory.clazz as? T
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
}
