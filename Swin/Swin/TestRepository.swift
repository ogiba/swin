//
//  TestRepository.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

protocol DataRepository {
    func loadData()
}

class TestRepository: DataRepository {
    
    private let testMapper: TestMapper
    
    init(testMapper: TestMapper) {
        self.testMapper = testMapper
    }
    
    func test(value: Int = 0) {
        print("Test \(value)")
        testMapper.map()
    }
    
    func loadData() {
        print("Loading data...")
    }
}
