//
//  UnitTestDemoTests.swift
//  UnitTestDemoTests
//
//  Created by Vivek Shah on 6/20/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import XCTest
@testable import UnitTestDemo

class UnitTestDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true)
        XCTAssertTrue(true)
        XCTAssertFalse(false)
        XCTAssertTrue(2 + 2 == 4, "addition goes wrong")
        
        XCTAssertEqual(2 + 3 , 2 + 1 + 2)
        XCTAssertNotEqual(2 + 7 , 5 + 3 )
        XCTAssertEqual(2 + 3 , 2 + 1 + 2,"Both objects should be equal")

        var nilObj: String?
        nilObj = nil
        XCTAssertNil(nilObj)
        
        let objValue = ""
        XCTAssertNotNil(objValue)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
