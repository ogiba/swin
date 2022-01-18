//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class Module {
    
    var factories: [InstanceFactory] = []
    
    func factory<T>(definition:@escaping  Definition<T>) -> Module {
        self.factories.append(InstanceFactory.create(definition: definition))
        return self
    }
}

typealias Definition<T> = () -> T
