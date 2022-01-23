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
    var callbacks: Callbacks<Any> = Callbacks(onClose: nil)
}
