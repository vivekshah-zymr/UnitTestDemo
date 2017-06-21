//
//  MainTests.swift
//  UnitTestDemo
//
//  Created by Vivek Shah on 6/20/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import XCTest
@testable import UnitTestDemo

class MainVCTests: XCTestCase {
    let vc = MainViewController()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIfNumberEvenCheck(){
        let odd = 45
        let even = 434
        XCTAssertFalse(vc.checkIfNumberEven(num: odd))
        XCTAssertTrue(vc.checkIfNumberEven(num: even))
        let minusNo = -434
        XCTAssertTrue(vc.checkIfNumberEven(num: minusNo))
    }
    
    func testSumOfEvenNumbersInFibonacci(){
        var limit = 6
        var ans = 2
        XCTAssertEqual(ans, vc.sumOfEvenNumbersInFibonacci(limit: limit))
        
        limit = 100
//        ans = 34
        ans = 44
        XCTAssertEqual(ans, vc.sumOfEvenNumbersInFibonacci(limit: limit), "The correct ans is 44")
        
        limit = 4000000
        ans = 4613732
        XCTAssertEqual(ans, vc.sumOfEvenNumbersInFibonacci(limit: limit))
    }
    
    func testStaticLoginCheck() {
        XCTAssertEqual(vc.checkLogin(user: "", pass: ""), "Username cannot be empty", "Blank credential Login check get failed")
        XCTAssertEqual(vc.checkLogin(user: "fake", pass: ""), "Password cannot be empty", "Blank credential Login check get failed")
        XCTAssertEqual(vc.checkLogin(user: "fake", pass: "fake"), "Username and password doesn't match", "fake credential Login check get failed")
        XCTAssertEqual(vc.checkLogin(user: "username", pass: "fake"), "Username and password doesn't match", "fake credential Login check get failed")
        XCTAssertEqual(vc.checkLogin(user: "username", pass: "password"), "", "Correct credential Login check get failed")
    }
}
