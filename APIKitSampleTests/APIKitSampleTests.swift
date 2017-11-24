//
//  APIKitSampleTests.swift
//  APIKitSampleTests
//
//  Created by Takahiro Tsuchiya on 2017/11/07.
//  Copyright © 2017 Takahiro Tsuchiya. All rights reserved.
//

import XCTest
@testable import APIKitSample
import APIKit

class APIKitSampleTests: XCTestCase {
    
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
        
        Session.send(GitHubAPI.SearchRepositories(query: "rxswift")) { result in
            print("1 --------------------------")
            switch result {
            case .success(let response):
                print("2 --------------------------")
                print(response)
            case .failure(.responseError(let error)):
                print("error: \(error)")
                print("3 - 1 --------------------------")
            case .failure(.connectionError(let error)):
                print("error: \(error)")
                print("3 - 2 --------------------------")
            case .failure(.requestError(let error)):
                print("error: \(error)")
                print("3 - 3 --------------------------")
            }
            print("4    --------------------------")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
