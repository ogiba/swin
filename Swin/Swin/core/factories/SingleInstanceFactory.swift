//
//  SingleInstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 20/01/2022.
//

import Foundation

class SingleInstanceFactory: Factory {
    var definition: Definition<Any>
    var clazzType: Any
    private var value: Any? = nil
    
    init(clazzType: Any, definition: @escaping  Definition<Any>) {
        self.clazzType = clazzType
        self.definition = definition
    }

    func create<T>(ofType: T.Type) -> T {
        guard let value = value as? T else {
            let value = definition() as! T
            self.value = value
            return value
        }
        return value
    }
    
    static func create<T>(_ type: T.Type?, definition: @escaping Definition<T>) -> Factory {
        return SingleInstanceFactory(
            clazzType: T.self,
            definition: definition
        )
    }
}

