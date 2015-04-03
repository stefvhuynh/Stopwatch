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
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(
            name: "Main",
            bundle: NSBundle(forClass: self.dynamicType)
        )
        
        viewController =
            storyboard.instantiateViewControllerWithIdentifier(
                "ViewControllerId"
            ) as ViewController
        
        let _ = viewController.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOutletsAreConnected() {
        XCTAssertNotNil(viewController.timeLabel, "timeLabel is nil")
        XCTAssertNotNil(viewController.startBtn, "startBtn is nil")
        XCTAssertNotNil(viewController.resetBtn, "resetBtn is nil")
    }
    
    func testOutletsHaveInitialValues() {
        XCTAssertEqual(
            viewController.timeLabel!.text!,
            "00:00",
            "timeLabel is not '00:00'"
        )
        XCTAssertEqual(
            viewController.startBtn!.titleLabel!.text!,
            "Start",
            "startBtn title is not 'Start'"
        )
        XCTAssertEqual(
            viewController.resetBtn!.titleLabel!.text!,
            "Reset",
            "resetBtn title is not 'Reset'"
        )
    }
    
    func testActionsAreConnected() {
        let startBtnActions = viewController.startBtn.actionsForTarget(
            viewController,
            forControlEvent: UIControlEvents.TouchUpInside
        )!
        
        let resetBtnActions = viewController.resetBtn.actionsForTarget(
            viewController,
            forControlEvent: UIControlEvents.TouchUpInside
        )!
    }
    // func testStartBtnTappedChangesStartBtnTitleAndBackgroundColor() {
    //     var startBtn = viewController.startBtn!
    //     
    //     viewController.startBtnTapped(startBtn)
    //     
    //     XCTAssertEqual(
    //         startBtn.titleLabel!.text!,
    //         "Stop",
    //         "startBtn title did not change to 'Stop'"
    //     )
    //     XCTAssertEqual(
    //         startBtn.backgroundColor!,
    //         UIColor.redColor(),
    //         "startBtn background color did not change to red"
    //     )
    //     
    //     viewController.startBtnTapped(startBtn)
    //     
    //     XCTAssertEqual(
    //         startBtn.titleLabel!.text!,
    //         "Start",
    //         "startBtn title did not change to 'Start'"
    //     )
    //     XCTAssertEqual(
    //         startBtn.backgroundColor!,
    //         UIColor.greenColor(),
    //         "startBtn background color did not change to green"
    //     )
    // }
    // 
    // func testStartBtnTappedChangesTimeLabel() {
    //     var startBtn = viewController.startBtn
    //     var timeLabel = viewController.timeLabel
    // }
    // 
    // func testResetBtnTapped() {
    //     
    // }
}