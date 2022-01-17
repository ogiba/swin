//
//  ContentView.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    let test = Swin.get(type: TestRepository.self)
    
    init() {
        test.test()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
