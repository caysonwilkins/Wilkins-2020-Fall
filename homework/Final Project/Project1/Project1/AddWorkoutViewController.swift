//
//  WorkoutViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 12/13/20.
//

import UIKit
import CoreData

class AddWorkoutViewController: UIViewController {

    @IBOutlet weak var workoutDescription: UITextView!
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        workoutDescription!.layer.borderWidth = 1
        workoutDescription!.layer.borderColor = UIColor.lightGray.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveOnClick(_ sender: Any) {
        if workoutName.text == "" || workoutDescription.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Please fill in all fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)

            }
        else {
            WorkoutController.createWorkout(name: workoutName.text!, description: workoutDescription.text!)
            NotificationCenter.default.post(Notification(name: Notification.Name("NEW_WORKOUT")))
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func backOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
