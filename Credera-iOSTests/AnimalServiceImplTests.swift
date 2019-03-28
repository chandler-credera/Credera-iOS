//
//  AnimalServiceImpl.swift
//  Credera-iOSTests
//
//  Created by Chandler Pergakis on 3/28/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import XCTest
@testable import Credera_iOS

class AnimalServiceImplTest: XCTestCase {
    
    var serviceImpl: AnimalServiceImpl

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        serviceImpl = AnimalServiceImpl()
        super.setUp()
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
    
    func testBearerToken(){
        serviceImpl.getBearerToken()
    }

}
