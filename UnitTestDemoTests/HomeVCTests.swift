//
//  HomeVCTests.swift
//  UnitTestDemo
//
//  Created by Vivek Shah on 6/21/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import XCTest
@testable import UnitTestDemo

class HomeVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIFetchParseTime() {
        let stringURL : String = "http://jsonplaceholder.typicode.com/users/1"
        
        self.measure {
            let url : URL = URL(string: stringURL)!
            do {
                let data = try NSData(contentsOf: url, options: NSData.ReadingOptions())
                let parsedData = try JSONSerialization.jsonObject(with: data as Data) as! [String:Any]
                print(parsedData)
            } catch {
                print(error)
            }
        }
    }
    
    func testAPIParseTime() {
        let stringURL : String = "http://jsonplaceholder.typicode.com/users/1"
        
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring: false) {
            let url : URL = URL(string: stringURL)!
            do {
                let data = try NSData(contentsOf: url, options: NSData.ReadingOptions())
                self.startMeasuring()
                _ = try JSONSerialization.jsonObject(with: data as Data) as! [String:Any]
            } catch {
                print(error)
            }
        }
    }
    
}
