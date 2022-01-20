//
//  InstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias Definition<T> = () -> T

class InstanceFactory: Factory {
    var definition: Definition<Any>
    var clazzType: Any
    
    init(clazzType: Any, definition: @escaping  Definition<Any>) {
        self.clazzType = clazzType
        self.definition = definition
    }
    
    func create<T>(ofType: T.Type) -> T {
        return definition() as! T
    }
    
    static func create<T>(definition:@escaping  Definition<T>) -> Factory {
        return InstanceFactory(
            clazzType: T.self,
            definition: definition
        )
    }
}
