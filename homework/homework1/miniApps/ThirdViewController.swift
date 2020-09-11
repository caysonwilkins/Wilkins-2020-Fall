//
//  ThirdViewController.swift
//  miniApps
//
//  Created by Cayson Wilkins on 9/10/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var RPSLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var computerGuess: UILabel!
    @IBOutlet weak var yourGuess: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    var randomNumber: Int = 0
    var wins: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rockButtonPress(_ sender: Any) {
        randomNumber = Int.random(in: 1...3)
        yourGuess.text = "You: rock"
        
        if (randomNumber == 1) {
            computerGuess.text = "Computer: rock"
            resultLabel.text = "Tie"
        }
        if (randomNumber == 2) {
            computerGuess.text = "Computer: paper"
            resultLabel.text = "Loss"
        }
        if (randomNumber == 3) {
            computerGuess.text = "Computer: scissors"
            resultLabel.text = "Win"
            wins += 1
            winsLabel.text = "Wins: " + String(wins)
        }
    }
    
    @IBAction func paperButtonPress(_ sender: Any) {
        randomNumber = Int.random(in: 1...3)
        yourGuess.text = "You: paper"
        
        if (randomNumber == 1) {
            computerGuess.text = "Computer: rock"
            resultLabel.text = "Win"
            wins += 1
            winsLabel.text = "Wins: " + String(wins)
        }
        if (randomNumber == 2) {
            computerGuess.text = "Computer: paper"
            resultLabel.text = "Tie"
        }
        if (randomNumber == 3) {
            computerGuess.text = "Computer: scissors"
            resultLabel.text = "Loss"
        }
    }
    
    @IBAction func scissorsButtonPress(_ sender: Any) {
        randomNumber = Int.random(in: 1...3)
        yourGuess.text = "You: scissors"
        
        if (randomNumber == 1) {
            computerGuess.text = "Computer: rock"
            resultLabel.text = "Loss"
        }
        if (randomNumber == 2) {
            computerGuess.text = "Computer: paper"
            resultLabel.text = "Win"
            wins += 1
            winsLabel.text = "Wins: " + String(wins)
            
        }
        if (randomNumber == 3) {
            computerGuess.text = "Computer: scissors"
            resultLabel.text = "Tie"
        }
        
    }
}
