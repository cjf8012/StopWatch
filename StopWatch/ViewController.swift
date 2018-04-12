//
//  ViewController.swift
//  StopWatch
//
//  Created by D7703_15 on 2018. 4. 12..
//  Copyright © 2018년 D7703_15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBt: UIButton!
    @IBOutlet weak var stopBt: UIButton!
    @IBOutlet weak var resetBt: UIButton!
    
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBt.layer.cornerRadius = 0.2 * startBt.bounds.size.width
        stopBt.layer.cornerRadius = 0.2 * stopBt.bounds.size.width
        resetBt.layer.cornerRadius = 0.2 * resetBt.bounds.size.width
    }
    
    @IBAction func start(_ sender: Any) {
    myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()})
        changeBt(start: false, stop: true, reset: true)
    }
    
    @IBAction func stop(_ sender: Any) {
    myTimer.invalidate()
        changeBt(start: true, stop: false, reset: true)
    }
    
    @IBAction func reset(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
        changeBt(start: true, stop: true, reset: false)
    }
    
    func updateTime(){
    count = count + 1
    let min = count / 60 / 100
    let sec = (count - (min * 60 * 100)) / 100
    let msec = count - (min * 60 * 100) - (sec * 100)
    timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
}
    func changeBt(start: Bool, stop: Bool, reset: Bool){
        startBt.isEnabled = start
        stopBt.isEnabled = stop
        resetBt.isEnabled = reset
    }
}
