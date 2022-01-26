//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias ModuleDeclaration = (Module) -> ()

func module(createdAtStart: Bool = false, _ moduleDeclaration:@escaping ModuleDeclaration) -> Module {
    let module = Module(createdAtStart)
    moduleDeclaration(module)
    return module
}

class Module {
    let createdAtStart: Bool
    
    var eagerInstances: Set<HashableInstanceFactory> = Set()
    
    var factories: Factories = Factories()
    
    init(_ createdAtStart: Bool = false) {
        self.createdAtStart = createdAtStart
    }
    
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
            createdAtStart: Bool = false,
            _ definition:@escaping Definition<T>
    ) -> Pair<Module, InstanceFactory> {
        if factories.isFactoryRegistered(key: "\(T.self)") {
            assertionFailure("Redeclaration of: \(T.self)")
        }
        let def = createDefinition(type, qualifier: qualifier, definition: definition)
        let factoryInstance = SingleInstanceFactory.create(beanDefinition: def)
        let indexKey = indexKey(def.clazzType as! T.Type, qualifier: def.qualifier)
        self.factories[indexKey] = factoryInstance
        if(createdAtStart || self.createdAtStart) {
            eagerInstances.update(with: HashableInstanceFactory(instanceFactory: factoryInstance))
        }
        return Pair(first: self, second: factoryInstance)
    }
    
    func close() {
        factories.compactMap({$0.value}).forEach {$0.dropAll()}
        factories.removeAll()
    }
}
