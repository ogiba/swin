//
//  Factories.swift
//  Swin
//
//  Created by Robert Ogiba on 22/01/2022.
//

import Foundation

typealias Factories = Dictionary<String, InstanceFactory>

extension Factories {
    func isFactoryRegistered(key: String) -> Bool {
        return contains { (registeredKey: String, _: InstanceFactory) in
            registeredKey == key
        }
    }
}
