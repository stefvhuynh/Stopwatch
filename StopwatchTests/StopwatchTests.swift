//
//  StopwatchTests.swift
//  StopwatchTests
//
//  Created by Stefan Huynh on 3/28/15.
//  Copyright (c) 2015 Stefan Huynh. All rights reserved.
//

import UIKit
import XCTest

class StopwatchTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of
        // each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of
        // each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad() {
        let viewController = ViewController()
        XCTAssertNotNil(viewController.view, "View did not load")
    }
    
    func testStartBtnTapped() {
    }
}
