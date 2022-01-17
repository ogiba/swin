//
//  InstanceFactory.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class InstanceFactory {
    let clazz: Any
    
    init(clazz: Any) {
        self.clazz = clazz
    }
    
    static func create<T>(clazz: T) -> InstanceFactory {
        return InstanceFactory(clazz: clazz)
    }
}
