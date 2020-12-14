//
//  WorkoutsViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 12/12/20.
//

import UIKit
import CoreData

class WorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
            tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WorkoutController.workoutList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell")

        let currentWorkout = WorkoutController.workoutList()[indexPath.row]
        cell?.textLabel?.text = currentWorkout.name

                return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        WorkoutViewController.currentWorkout = WorkoutController.workoutList()[indexPath.row]
        performSegue(withIdentifier: "toWorkout", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(workoutListWasUpdated(notification:)), name: NSNotification.Name("NEW_WORKOUT"), object: nil)

        
        WorkoutController.fetchData()
        // Do any additional setup after loading the view.
    }
    
    @objc
        func workoutListWasUpdated(notification:Notification) {
            WorkoutController.fetchData()
            tableView.reloadData()
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
