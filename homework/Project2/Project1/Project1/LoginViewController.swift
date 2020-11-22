//
//  LoginViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 11/17/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPress(_ sender: Any) {
        
        if usernameText.text == "" || passwordText.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)
            }
            else

            {

                let login = UserController.CheckForUserNameAndPasswordMatch(username : usernameText.text! as String, password : passwordText.text! as String)
                if login {
                    performSegue(withIdentifier: "signedIn", sender: self)
                } else {
                    let alert = UIAlertController(title: "Information", message: "Username/Password Incorrect", preferredStyle: .alert)

                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)

                    alert.addAction(ok)
                    
                    self.present(alert, animated: true, completion: nil)
                }


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
