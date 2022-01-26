//
//  InstanceRegistry.swift
//  Swin
//
//  Created by Robert Ogiba on 27/01/2022.
//

import Foundation

class InstanceRegistry {
    var instances: Factories = Factories()
    private var eagerInstances = Set<HashableInstanceFactory>()
}
