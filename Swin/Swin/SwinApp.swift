//
//  SwinApp.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import SwiftUI

@main
struct SwinApp: App {
//    @Environment(\.scenePhase) var scenePhase
    
    let swin: Swin
    init() {
        swin = startSwin {
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
//        .onChange(of: scenePhase) { (newPhase) in
//            switch newPhase {
//            case .background:
//                swin
//            default:
//                print("test")
//            }
//        }
    }
}
