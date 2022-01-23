//
//  Factory.swift
//  Swin
//
//  Created by Robert Ogiba on 20/01/2022.
//

import Foundation

protocol InstanceFactory {
    var beanDefinition: BeanDefinition {get set}
    func create<T>(ofType: T.Type) -> T
    func drop()
    func dropAll()
}
