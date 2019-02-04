//
//  ViewController.swift
//  sillyTimer
//
//  Created by sinahk on 2/4/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    var startTime = TimeInterval()
    var timer : Timer = Timer()

    func updateTime(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var elapsedTime : TimeInterval = currentTime - startTime
        
        let minutes = UInt8(elapsedTime/60.0)
        elapsedTime -= (TimeInterval(minutes)*60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= (TimeInterval(seconds))
        
        let fraction = UInt8(elapsedTime*100)
        
        let strMinutes = minutes>9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds>9 ? String(seconds):"0" + String(seconds)
        let strFractions = fraction>9 ? String(fraction):"0" + String(fraction)

        stopWatchTimer.text = "\(strMinutes)+:+\(strSeconds)+:+\(strFractions)"
    }
    
    @IBOutlet weak var stopWatchTimer: UILabel!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBAction func startButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: true)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector(("updateTime")), userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
    }
    
    
    @IBOutlet weak var stopButtonOutlet: UIButton!
    @IBAction func stopButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: false)
    }
    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBAction func resetButtonAction(_ sender: Any) {
        makeStartAppear(makeAppear: false)
    }
    
    func makeStartAppear(makeAppear: Bool){
        if makeAppear {
            print("true")
            startButtonOutlet.isHidden = true
            stopButtonOutlet.isHidden = false
            resetButtonOutlet.isHidden = false
        }else{
            print("false")
            startButtonOutlet.isHidden = false
            stopButtonOutlet.isHidden = true
            resetButtonOutlet.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

