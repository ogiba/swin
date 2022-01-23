//
//  Qualifier.swift
//  Swin
//
//  Created by Robert Ogiba on 24/01/2022.
//

import Foundation

protocol Qualifier {
    var value: QualifierValue {get}
}

typealias QualifierValue = String

func named(name: String) -> Qualifier {
    return StringQualifier(value: name)
}
