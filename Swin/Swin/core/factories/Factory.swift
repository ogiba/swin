//
//  Factory.swift
//  Swin
//
//  Created by Robert Ogiba on 20/01/2022.
//

import Foundation

protocol Factory {
    var definition: Definition<Any> {get}
    var clazzType: Any {get}
    func create<T>(ofType: T.Type) -> T
    static func create<T>(_ type: T.Type?, definition:@escaping  Definition<T>) -> Factory
}
