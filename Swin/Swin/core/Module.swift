//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class Module {
    
    var factories: [InstanceFactory] = []
    
    func factory<T>(_ definition:@escaping  Definition<T>) -> Module {
        self.factories.append(InstanceFactory.create(definition: definition))
        return self
    }
}

func module(_ moduleDeclaration:@escaping (Module) -> ()) -> Module {
    let module = Module()
    moduleDeclaration(module)
    return module
}
