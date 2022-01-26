//
//  InstanceRegistry.swift
//  Swin
//
//  Created by Robert Ogiba on 27/01/2022.
//

import Foundation

class InstanceRegistry {
    var instances: Factories = Factories()
    private var eagerInstances = Set<HashableInstanceFactory>()
    
    func loadModules(modules: [Module]) {
        modules.forEach { module in
            eagerInstances = eagerInstances.union(module.eagerInstances)
        }
    }
    
    private func loadModule(module: Module) {
        module.factories.forEach { (indexKey, factory) in
            instances[indexKey] = factory
        }
    }
}
