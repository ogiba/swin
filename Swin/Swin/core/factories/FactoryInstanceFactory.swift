//
//  InstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

typealias Definition<T> = () -> T

class FactoryInstanceFactory: InstanceFactory {
    var beanDefinition: BeanDefinition
    
    init(beanDefintion: BeanDefinition) {
        self.beanDefinition = beanDefintion
    }
    
    func create<T>(ofType: T.Type) -> T {
        return beanDefinition.definition() as! T
    }
    
    func drop() {
        self.beanDefinition.callbacks.onClose?(nil)
    }
    
    func dropAll() {}
    
    static func create<T>(_ type: T.Type?, definition:@escaping  Definition<T>) -> InstanceFactory {
        return FactoryInstanceFactory(
            beanDefintion: BeanDefinition(
                clazzType: T.self,
                definition: definition
            )
        )
    }
}
