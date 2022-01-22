//
//  DefinitionBindin.swift
//  Swin
//
//  Created by Robert Ogiba on 23/01/2022.
//

import Foundation

extension Pair where T == Module, T2 == InstanceFactory {
    
    @discardableResult
    func onClose(_ closeCallback: @escaping () -> ()) -> Pair<Module, InstanceFactory> {
        return self
    }
}
