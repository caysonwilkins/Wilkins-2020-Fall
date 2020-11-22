//
//  UserController.swift
//  Project1
//
//  Created by Cayson Wilkins on 11/17/20.
//

import UIKit
import CoreData

class UserController: NSObject {

    
    class func CheckForUserNameAndPasswordMatch( username: String, password : String) -> Bool {
        var result = NSArray()
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        let predicate = NSPredicate(format: "username = %@", username)

        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray

            if result.count>0
            {
                let objectentity = result.firstObject as! User

                if objectentity.username == username && objectentity.password == password
                {
                    print("Login Succesfully")
                    return true
                }
                else
                {
                    print("Wrong username or password !!!")
                    return false
                }
            }
        }

        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
            return false
        }
        return false
    }
    
    class func createUser(username:String, password:String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let user:User = User(context: context)

        user.username = username
        user.password = password

        do
                {
                    try context.save()
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
        }
}
