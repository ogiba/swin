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
