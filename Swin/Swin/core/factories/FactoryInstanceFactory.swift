//
//  InstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias Definition<T> = () -> T

class FactoryInstanceFactory: InstanceFactory {
    var definition: Definition<Any>
    var clazzType: Any
    
    init(clazzType: Any, definition: @escaping  Definition<Any>) {
        self.clazzType = clazzType
        self.definition = definition
    }
    
    func create<T>(ofType: T.Type) -> T {
        return definition() as! T
    }
    
    func drop() {}
    
    func dropAll() {}
    
    static func create<T>(_ type: T.Type?, definition:@escaping  Definition<T>) -> InstanceFactory {
        return FactoryInstanceFactory(
            clazzType: T.self,
            definition: definition
        )
    }
}
