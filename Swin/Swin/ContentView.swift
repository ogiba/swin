//
//  ContentView.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    let test = get(type: TestRepository.self)
    var test2 = inject(type: TestRepository.self)
    let anotherRepository = get(type: AnotherTestRepository.self)
    let dataRepository = get(type: DataRepository.self)
    
    init() {
        test.test()
        test2.value.test(value: 1)
        anotherRepository.callMeBaby()
        dataRepository.loadData()
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
