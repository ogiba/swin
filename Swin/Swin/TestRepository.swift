//
//  TestRepository.swift
//  Swin
//
//  Created by Robert Ogiba on 17/01/2022.
//

import Foundation

class TestRepository {
    
    private let testMapper: TestMapper
    
    init(testMapper: TestMapper) {
        self.testMapper = testMapper
    }
    
    func test(value: Int = 0) {
        print("Test \(value)")
        testMapper.map()
    }
}
