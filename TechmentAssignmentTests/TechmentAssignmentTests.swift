//
//  TechmentAssignmentTests.swift
//  TechmentAssignmentTests
//
//  Created by NayomeDevapriyaAnga on 01/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import XCTest
@testable import TechmentAssignment

class TechmentAssignmentTests: XCTestCase {
    var sut: HomeViewModel!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeViewModel.init(searchString: "sql")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
