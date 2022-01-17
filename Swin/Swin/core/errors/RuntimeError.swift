//
//  RuntimeError.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation


struct RuntimeError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        return message
    }
}
