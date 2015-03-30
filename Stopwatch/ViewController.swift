//
//  ViewController.swift
//  Stopwatch
//
//  Created by Stefan Huynh on 3/28/15.
//  Copyright (c) 2015 Stefan Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startBtn: UIButton!
   
    @IBAction func startBtnTapped(sender: UIButton) {
        (startBtn.titleLabel!.text == "Start") ?
            startStopWatch() : stopStopWatch()
    }
    
    @IBAction func resetBtnTapped(sender: AnyObject) {
        timeLabel.text = "00:00"
        stopStopWatch()
    }
    
    func updateTimeLabel() {
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
    
    private var timer = NSTimer()
    
    private func startStopWatch() {
        startBtn.setTitle("Stop", forState: UIControlState.Normal)
        startBtn.backgroundColor = UIColor.redColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1,
            target: self,
            selector: Selector("updateTimeLabel"),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func stopStopWatch() {
        startBtn.setTitle("Start", forState: UIControlState.Normal)
        startBtn.backgroundColor = UIColor.greenColor()
        
        timer.invalidate()
    }
}