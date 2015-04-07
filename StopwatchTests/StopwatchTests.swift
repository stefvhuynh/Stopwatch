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
            viewController.startBtn.titleForState(UIControlState.Normal)!,
            "Start",
            "startBtn title is not 'Start'"
        )
        XCTAssertEqual(
            viewController.resetBtn.titleForState(UIControlState.Normal)!,
            "Reset",
            "resetBtn title is not 'Reset'"
        )
    }
    
    func testActionsAreConnected() {
        let startBtnActions: NSArray = viewController.startBtn.actionsForTarget(
            viewController,
            forControlEvent: UIControlEvents.TouchUpInside
        )!
        
        let resetBtnActions: NSArray = viewController.resetBtn.actionsForTarget(
            viewController,
            forControlEvent: UIControlEvents.TouchUpInside
        )!
        
        XCTAssertTrue(
            startBtnActions.containsObject("startBtnTapped:"),
            "startBtnTapped is not connected"
        )
        XCTAssertTrue(
            resetBtnActions.containsObject("resetBtnTapped:"),
            "resetBtnTapped is not connected"
        )
    }
    
    func testStartBtnTappedChangesStartBtnTitleAndBackgroundColor() {
        var startBtn = viewController.startBtn!
        
        startBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        XCTAssertEqual(
            startBtn.titleForState(UIControlState.Normal)!,
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
            startBtn.titleForState(UIControlState.Normal)!,
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
        var startBtn = viewController.startBtn!
        var timeLabel = viewController.timeLabel!
        
        startBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        NSRunLoop.currentRunLoop().runUntilDate(
            NSDate(timeIntervalSinceNow: 4.0)
        )
        
        XCTAssertEqual(
            timeLabel.text!,
            "00:04",
            "timeLabel did not update"
        )
    }
    
    func testResetBtnTappedChangesStartBtnTitle() {
        let startBtn = viewController.startBtn!
        let resetBtn = viewController.resetBtn!
        
        startBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        NSRunLoop.currentRunLoop().runUntilDate(
            NSDate(timeIntervalSinceNow: 3.0)
        )
        
        XCTAssertEqual(
            startBtn.titleForState(UIControlState.Normal)!,
            "Stop",
            "startBtn title should be 'Stop'"
        )
        
        viewController.resetBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        XCTAssertEqual(
            startBtn.titleForState(UIControlState.Normal)!,
            "Start",
            "startBtn title should be 'Start'"
        )
    }
    
    func testResetBtnTappedChangesTimeLabel() {
        let startBtn = viewController.startBtn!
        let resetBtn = viewController.resetBtn!
        let timeLabel = viewController.timeLabel!
        
        startBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        NSRunLoop.currentRunLoop().runUntilDate(
            NSDate(timeIntervalSinceNow: 3.0)
        )
        
        XCTAssertEqual(
            timeLabel.text!,
            "00:03",
            "timeLabel should be '00:03'"
        )
        
        viewController.resetBtn.sendActionsForControlEvents(
            UIControlEvents.TouchUpInside
        )
        
        XCTAssertEqual(
            timeLabel.text!,
            "00:00",
            "timeLabel was not reset"
        )
    }
}