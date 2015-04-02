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
    let viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        
        viewController.startBtn = UIButton()
        viewController.startBtn
            .setTitle("Start", forState: UIControlState.Normal)
        
        viewController.timeLabel = UILabel()
        viewController.timeLabel.text = "00:00"
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewController.startBtn = nil
        viewController.timeLabel = nil
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(viewController.view, "View did not load")
    }
    
    func testStartBtnTappedChangesStartBtnTitleAndBackgroundColor() {
        var startBtn = viewController.startBtn
        
        viewController.startBtnTapped(startBtn)
        
        XCTAssertEqual(
            startBtn.titleLabel!.text!,
            "Stop",
            "startBtn title did not change to 'Stop'"
        )
        XCTAssertEqual(
            startBtn.backgroundColor!,
            UIColor.redColor(),
            "startBtn background color did not change to red"
        )
        
        viewController.startBtnTapped(startBtn)
        
        XCTAssertEqual(
            startBtn.titleLabel!.text!,
            "Start",
            "startBtn title did not change to 'Start'"
        )
        XCTAssertEqual(
            startBtn.backgroundColor!,
            UIColor.greenColor(),
            "startBtn background color did not change to green"
        )
    }
    
    func testStartBtnTappedChangesTimeLabel() {
        var startBtn = viewController.startBtn
        var timeLabel = viewController.timeLabel
    }
    
    func testResetBtnTapped() {
        
    }
}