//
//  ViewController.swift
//  Stopwatch
//
//  Created by Stefan Huynh on 3/28/15.
//  Copyright (c) 2015 Stefan Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    var timer = NSTimer()
   
    @IBAction func startBtnTapped(sender: UIButton) {
        if startButton.titleLabel!.text == "Start" {
            startButton.setTitle("Stop", forState: UIControlState.Normal)
            startButton.setTitleColor(
                UIColor.redColor(),
                forState: UIControlState.Normal
            )
            startStopWatch()
        } else {
            startButton.setTitle("Start", forState: UIControlState.Normal)
            startButton.setTitleColor(
                UIColor.greenColor(),
                forState: UIControlState.Normal
            )
            stopStopWatch()
        }
    }
    
    @IBAction func resetBtnTapped(sender: AnyObject) {
        stopStopWatch()
        timeLabel.text = "00:00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func updateTimeLabel() {
        let timeArr = timeLabel.text!.componentsSeparatedByString(":")
        let minutes = timeArr[0].toInt()!
        let seconds = timeArr[1].toInt()!
        var minutesStr: String
        var secondsStr: String
        
        if seconds / 59 < 1 {
            minutesStr =
                (minutes < 10) ? "0" + String(minutes) : String(minutes)
            secondsStr =
                (seconds < 9) ? "0" + String(seconds + 1) : String(seconds + 1)
        } else {
            minutesStr =
                (minutes < 9) ? "0" + String(minutes + 1) : String(minutes + 1)
            secondsStr = "00"
        }
        
        timeLabel.text = "\(minutesStr):\(secondsStr)"
    }
    
    private func startStopWatch() {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1,
            target: self,
            selector: Selector("updateTimeLabel"),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func stopStopWatch() {
        timer.invalidate()
    }
}