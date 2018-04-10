//
//  ViewController.swift
//  Start Stop Reset Watch
//
//  Created by D7703_23 on 2018. 4. 10..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timelbl: UILabel!
    var count = 0
    var myTimer = Timer()
    var time = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timelbl.text = String(format : "%02d:%02d:%02d", min, sec, msec)
    }

    @IBAction func Start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
    
    
    @IBAction func Stop(_ sender: Any) {
        myTimer.invalidate()
    }
    
    
    @IBAction func Reset(_ sender: Any) {
        count = 0
        timelbl.text = "00:00:00"
    }
    
    
}

