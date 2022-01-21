//
//  Module.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias ModuleDeclaration = (Module) -> ()

class Module {
    
    var factories: [Factory] = []
    
    func factory<T>(_ type: T.Type? = nil, _ definition:@escaping  Definition<T>) {
        self.factories.append(InstanceFactory.create(definition: definition))
    }
    
    func single<T>(_ definition:@escaping  Definition<T>) {
        self.factories.append(SingleInstanceFactory.create(definition: definition))
    }
}

func module(_ moduleDeclaration:@escaping ModuleDeclaration) -> Module {
    let module = Module()
    moduleDeclaration(module)
    return module
}
