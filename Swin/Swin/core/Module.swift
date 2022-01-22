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
    
    @discardableResult
    func factory<T>(_ type: T.Type? = nil, _ definition:@escaping  Definition<T>) -> (Module, InstanceFactory) {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        let factoryInstance = FactoryInstanceFactory.create(type, definition: definition)
        self.factories["\(T.self)"] = factoryInstance
        return (self, factoryInstance)
    }
    
    @discardableResult
    func single<T>(_ type: T.Type? = nil, _ definition:@escaping  Definition<T>) -> (Module, InstanceFactory) {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        let factoryInstance = SingleInstanceFactory.create(type, definition: definition)
        self.factories["\(T.self)"] = factoryInstance
        return (self, factoryInstance)
    }
}
