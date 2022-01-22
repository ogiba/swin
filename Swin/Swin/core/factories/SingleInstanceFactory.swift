//
//  SingleInstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 20/01/2022.
//

import Foundation

class SingleInstanceFactory: InstanceFactory {
    var beanDefinition: BeanDefinition
    private var value: Any? = nil
    
    init(beanDefinition: BeanDefinition) {
        self.beanDefinition = beanDefinition
    }

    func create<T>(ofType: T.Type) -> T {
        guard let value = value as? T else {
            let value = beanDefinition.definition() as! T
            self.value = value
            return value
        }
        return value
    }
    
    func drop() {
        self.value = nil
    }
    
    func dropAll() {
        drop()
    }
    
    static func create<T>(_ type: T.Type?, definition: @escaping Definition<T>) -> InstanceFactory {
        return SingleInstanceFactory(
            beanDefinition: BeanDefinition(
                clazzType: T.self,
                definition: definition
            )
        )
    }
}

