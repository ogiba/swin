//
//  Factory.swift
//  Swin
//
//  Created by Robert Ogiba on 20/01/2022.
//

import Foundation

protocol InstanceFactory {
    var identifier: String {get}
    var beanDefinition: BeanDefinition {get set}
    func create<T>(ofType: T.Type) -> T
    func drop()
    func dropAll()
}

struct HashableInstanceFactory: Hashable {
    let instanceFactory: InstanceFactory
    
    static func == (lhs: HashableInstanceFactory, rhs: HashableInstanceFactory) -> Bool {
        return lhs.instanceFactory.identifier.isEqual(rhs.instanceFactory.identifier)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(instanceFactory.identifier)
    }
}
