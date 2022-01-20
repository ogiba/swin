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
        startSwin {
            $0.modules(modules: [
                module {
                        $0.factory { TestRepository(testMapper: Swin.get(type: TestMapper.self)) }
                        $0.single { TestMapper()}
                }
            ])
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
