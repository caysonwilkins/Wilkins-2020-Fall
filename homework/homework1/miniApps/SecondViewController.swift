//
//  SecondViewController.swift
//  miniApps
//
//  Created by Cayson Wilkins on 9/3/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var clickButtonText: UILabel!
    @IBOutlet weak var bruhButton: UIButton!
    @IBOutlet weak var bruhCountdown: UILabel!
    @IBOutlet weak var bruhPoints: UILabel!
    @IBOutlet weak var trashPointsButton: UIButton!
    
    var timer = Timer()
    var seconds = 6
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bruhButtonPress(_ sender: Any) {
        clickButtonText.isHidden = true
        bruhButton.isHidden = true
        bruhCountdown.isHidden = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.counter), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func trashPointsPressed(_ sender: Any) {
        points = 0
        bruhPoints.text = "Bruh points: " + String(points)
    }
    
    @objc func counter() {
        seconds -= 1
        bruhCountdown.text = String(seconds-1)
        
        if (seconds == 1) {
            
            points += 1
            bruhPoints.text = "Bruh points: " + String(points)
            
            bruhCountdown.text = "BRUH"
            bruhCountdown.textColor = UIColor.red
            self.view.backgroundColor = UIColor.blue
        }
        if (seconds == 0) {
            bruhCountdown.text = "5"
            timer.invalidate()
            clickButtonText.isHidden = false
            bruhButton.isHidden = false
            bruhCountdown.isHidden = true
            seconds = 6
            bruhCountdown.textColor = UIColor.black
            self.view.backgroundColor = UIColor.white
        }
    }
    
}

