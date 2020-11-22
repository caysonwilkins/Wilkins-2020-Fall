//
//  SignUpViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 11/17/20.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountPress(_ sender: Any) {
        
        if usernameText.text == "" || passwordText.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Please fill in all fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)

            }
        else {
            UserController.createUser(username: usernameText.text!, password: passwordText.text!)
        }
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
