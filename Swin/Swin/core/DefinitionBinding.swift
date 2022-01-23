//
//  DefinitionBindin.swift
//  Swin
//
//  Created by Robert Ogiba on 23/01/2022.
//

import Foundation

extension Pair where T == Module, T2 == InstanceFactory {
    
    @discardableResult
    mutating func onClose<T>(_ type: T.Type? = nil, closeCallback: @escaping OnCloseCallback<T>) -> Pair<Module, InstanceFactory> {
        second.beanDefinition.callbacks = Callbacks<Any>(onClose: { closeCallback($0 as? T) })
        return self
    }
}
