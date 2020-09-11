//
//  FirstViewController.swift
//  miniApps
//
//  Created by Cayson Wilkins on 9/3/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var redSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSwitch.setOn(false, animated: false)
        // Do any additional setup after loading the view.
    }

    @IBAction func concatTapped(_ sender: Any) {
        
        let concatenatedString = "Hello \(firstNameTextField.text ?? "Please Enter") \(lastNameTextField.text ?? " Name"), nice to meet you buddy!"
        outputLabel.text = concatenatedString
    }
    
    @IBAction func redSwitched(_ sender: Any) {
        if redSwitch.isOn {
            outputLabel.textColor = UIColor.red;
        } else {
            outputLabel.textColor = UIColor.black;
        }
    }
    
}

