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
            $0.modules([
                module {
                    $0.factory{ TestRepository(testMapper: get(TestMapper.self)) }
                    $0.single { TestMapper() }
                    $0.factory(DataRepository.self) { TestRepository(testMapper: get(TestMapper.self)) }
                },
                module {
                    $0.factory { AnotherTestRepository() }
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
