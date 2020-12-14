//
//  WorkoutViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 12/13/20.
//

import UIKit

class WorkoutViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var workoutDescription: UITextView!
    
    static var currentWorkout: Workout = Workout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        workoutDescription!.layer.borderWidth = 1
        workoutDescription!.layer.borderColor = UIColor.lightGray.cgColor
        
        if ((WorkoutViewController.currentWorkout.name?.isEmpty) != nil) {
            workoutName.text = WorkoutViewController.currentWorkout.name

            workoutDescription.text = WorkoutViewController.currentWorkout.desc!

            workoutName.isUserInteractionEnabled = false;
            workoutDescription.isEditable = false;
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backOnPress(_ sender: Any) {
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
