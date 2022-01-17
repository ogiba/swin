//
//  SwinApp.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import SwiftUI

@main
struct SwinApp: App {
    
    init() {
        Swin.startSwin(modules: [
            Module().factory(clazz: TestRepository())
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
