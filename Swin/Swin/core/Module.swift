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
    func factory<T>(
        _ type: T.Type? = nil,
        qualifier: Qualifier? = nil,
        _ definition:@escaping  Definition<T>
    ) -> Pair<Module, InstanceFactory> {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        let def = createDefinition(type, qualifier: qualifier, definition: definition)
        let factoryInstance = FactoryInstanceFactory.create(beanDefinition: def)
        let indexKey = indexKey(def.clazzType as! T.Type, qualifier: def.qualifier)
        self.factories[indexKey] = factoryInstance
        return Pair(first: self, second: factoryInstance)
    }
    
    @discardableResult
    func single<T>(
            _ type: T.Type? = nil,
            qualifier: Qualifier? = nil,
            _ definition:@escaping Definition<T>
    ) -> Pair<Module, InstanceFactory> {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        let def = createDefinition(type, qualifier: qualifier, definition: definition)
        let factoryInstance = SingleInstanceFactory.create(beanDefinition: def)
        let indexKey = indexKey(def.clazzType as! T.Type, qualifier: def.qualifier)
        self.factories[indexKey] = factoryInstance
        return Pair(first: self, second: factoryInstance)
    }
    
    func close() {
        factories.compactMap({$0.value}).forEach {$0.dropAll()}
        factories.removeAll()
    }
}
