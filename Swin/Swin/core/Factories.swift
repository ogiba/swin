//
//  Factories.swift
//  Swin
//
//  Created by Robert Ogiba on 22/01/2022.
//

import Foundation

typealias Factories = Dictionary<String, Factory>

extension Factories {
    func isFactoryRegistered(key: String) -> Bool {
        return contains { (registeredKey: String, _: Factory) in
            registeredKey == key
        }
    }
}
