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
    
    @IBAction func startButtonTapped(sender: UIButton) {
        startButton.setTitle("Stop", forState: UIControlState.Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Private
    
    private func startStopWatch() -> Void {
        
    }
    
    private func stopStopWatch() -> Void {
        
    }
}

