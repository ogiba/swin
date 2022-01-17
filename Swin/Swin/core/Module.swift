//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class Module: Hashable {
    
    var factories: [InstanceFactory] = []
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
    
    func factory<T>(clazz: T) -> Module {
        self.factories.append(InstanceFactory.create(clazz: clazz))
        return self
    }
    
    static func == (lhs: Module, rhs: Module) -> Bool {
        return lhs === rhs
    }
}
