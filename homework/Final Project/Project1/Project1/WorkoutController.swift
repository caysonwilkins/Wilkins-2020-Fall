//
//  WorkoutController.swift
//  Project1
//
//  Created by Cayson Wilkins on 12/13/20.
//

import UIKit
import CoreData

class WorkoutController: NSObject {
    
    static var workoutArray = Array<Workout>()


    class func fetchData(){
        var result = Array<Workout>()
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")

        do
        {
            result = try context.fetch(fetchrequest) as! Array<Workout>
            workoutArray = result
            
        }

        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }


    }
    
    class func createWorkout(name:String, description:String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let workout:Workout = Workout(context: context)

        workout.name = name
        workout.desc = description

        do
                {
                    try context.save()
                    workoutArray.append(workout)
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
        }
    
    class func workoutList() -> Array<Workout>{
            return WorkoutController.workoutArray
    }

}
