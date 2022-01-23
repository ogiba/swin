//
//  StringQualifier.swift
//  Swin
//
//  Created by Robert Ogiba on 24/01/2022.
//

import Foundation

class StringQualifier: Qualifier {
    var value: QualifierValue
    
    init(value: QualifierValue) {
        self.value = value
    }
}
