//
//  Lazy.swift
//  Swin
//
//  Created by Robert Ogiba on 19/01/2022.
//

import Foundation


struct Lazy<T> {
    private let initValue: Definition<Any>
    lazy var value: T = {
        initValue() as! T
    }()
    
    init(initValue: @escaping Definition<Any>) {
        self.initValue = initValue
    }
}
