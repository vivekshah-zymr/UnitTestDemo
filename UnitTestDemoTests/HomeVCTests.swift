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
    let error : NSError! = nil
    var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAPIFetchParseTime() {
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
    
    func testGetAPIParseTime() {
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
    
    func testPostAPIForProperResponse() {
        expectation = expectation(description: "POST Login request check")
        
        let urlToRequest = "https://reqres.in/api/login"
        let url = URL(string: urlToRequest)!
        let serviceInput = ["email": "peter@klaven", "password":"cityslicka"] as [String: Any]
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: serviceInput, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print("Response JSON===\(json)")
                    let tokenID = json["token"] as! String
                    print("tokenID==\(tokenID )")
                    XCTAssertNotNil(tokenID) // Raise the exception in case of we didn't receive tokenID in response
                    self.expectation.fulfill()
                    // handle json...
                }
            } catch let error {
                XCTFail("Expectation Failed with error: %@", file: error as! StaticString);
            }
        })
        task.resume()
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testPostAPIFetchParseTime() {
        let urlToRequest = "https://reqres.in/api/login"
        let url = URL(string: urlToRequest)!
        let serviceInput = ["email": "peter@klaven", "password":"cityslicka"] as [String: Any]
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: serviceInput, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        self.measure {
            let expectations = self.expectation(description: "POST Login request performance check")
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                guard error == nil else {
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print("response JSON = \(json)")
                        expectations.fulfill()
                    }
                } catch let error {
                    XCTFail("Expectation Failed with error: %@", file: error as! StaticString);
                }
            })
            task.resume()
            self.waitForExpectations(timeout: 10.0) { (error) in
                if let error = error {
                    XCTFail("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
