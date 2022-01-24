//
//  BeanDefinition.swift
//  Swin
//
//  Created by Robert Ogiba on 23/01/2022.
//

import Foundation

struct BeanDefinition {
    let clazzType: Any
    let definition: Definition<Any>
    var qualifier: Qualifier? = nil
    var callbacks: Callbacks<Any> = Callbacks(onClose: nil)
}

func indexKey<T>(_ type: T.Type, qualifier: Qualifier?) -> String {
    let tq = qualifier?.value ?? ""
    return "\(T.self):\(tq)"
}

func createDefinition<T>(
    _ type: T.Type?,
    qualifier: Qualifier?,
    definition:@escaping  Definition<T>
) -> BeanDefinition {
    return BeanDefinition(
        clazzType: T.self,
        definition: definition,
        qualifier: qualifier
    )
}
