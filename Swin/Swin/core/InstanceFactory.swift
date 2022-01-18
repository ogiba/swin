//
//  InstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class InstanceFactory {
    let definition: Definition<Any>
    let clazzType: Any
    
    init(clazzType: Any, definition: @escaping  Definition<Any>) {
        self.clazzType = clazzType
        self.definition = definition
    }
    
    static func create<T>(definition:@escaping  Definition<T>) -> InstanceFactory {
        return InstanceFactory(
            clazzType: T.self,
            definition: definition
        )
    }
}
