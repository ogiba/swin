//
//  Lazy.swift
//  Swin
//
//  Created by Robert Ogiba on 19/01/2022.
//

import Foundation


class Lazy<T> {
    private let initValue: Definition<Any>
    lazy var value: T = {
        initValue() as! T
    }()
    
    init(initValue: @escaping Definition<Any>) {
        self.initValue = initValue
    }
    
    convenience init(@LazyBuilder<T> builder: () -> Definition<Any>) {
        self.init(initValue: builder())
    }
}

@resultBuilder
struct LazyBuilder<T> {
    static func buildBlock(_ component: @escaping Definition<Any>) -> Definition<Any> {
        return component
    }
    
    static func buildExpression(_ definition: @escaping Definition<Any>) -> Definition<Any> {
        return definition
    }
}
