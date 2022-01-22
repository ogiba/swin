//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias ModuleDeclaration = (Module) -> ()

func module(_ moduleDeclaration:@escaping ModuleDeclaration) -> Module {
    let module = Module()
    moduleDeclaration(module)
    return module
}

class Module {
    
    var factories: Factories = Factories()
    
    func factory<T>(_ type: T.Type? = nil, _ definition:@escaping  Definition<T>) {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        self.factories["\(T.self)"] = FactoryInstanceFactory.create(type, definition: definition)
    }
    
    func single<T>(_ type: T.Type? = nil, _ definition:@escaping  Definition<T>) {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        self.factories["\(T.self)"] = SingleInstanceFactory.create(type, definition: definition)
    }
}
