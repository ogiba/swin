//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class Module {
    
    var factories: [InstanceFactory] = []
    
    func factory<T>(clazz: T) -> Module {
        self.factories.append(InstanceFactory.create(clazz: clazz))
        return self
    }
}
