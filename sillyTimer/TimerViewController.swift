//
//  TimerViewController.swift
//  sillyTimer
//
//  Created by sinahk on 2/4/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var counter = 30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBAction func startButtonTimerPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        counter = counter - 1
        TimerLabel.text = "\(counter)"
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
