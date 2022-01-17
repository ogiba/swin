//
//  Swin.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation
import SwiftUI

class Swin {
    
    static var swin: Swin?
    let modules: [String]
    
    init(modules: [String]) {
        self.modules = modules
    }
    
    static func startSwin(modules: [String]) {
        if(swin == nil) {
            let swin = Swin(modules: modules)
            self.swin = swin
        }
        return
    }
}
