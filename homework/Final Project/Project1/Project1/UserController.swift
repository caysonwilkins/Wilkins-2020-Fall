//
//  UserController.swift
//  Project1
//
//  Created by Cayson Wilkins on 11/17/20.
//

import UIKit
import CoreData

class UserController: NSObject {

    static var currentUser: User = User()
    static var friendsArray = Array<Friends>()
    
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
                    currentUser = objectentity
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
    
    class func CheckForUserName( username: String) -> Bool {
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

                if objectentity.username == username
                {
                    print("User Exists")
                    return true
                }
                else
                {
                    print("User Does Not Exist")
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
                    currentUser = user
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
        }
    
    class func fetchFriendsData(){
        var result = Array<Friends>()
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Friends")

        let predicate = NSPredicate(format: "username = %@", currentUser.username!)

        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as! Array<Friends>
            friendsArray = result
            
        }

        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }


    }
    
    class func CheckForFriend( username: String) -> Bool {
        var result = NSArray()
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Friends")

        let predicate1 = NSPredicate(format: "username = %@", currentUser.username!)
        let predicate2 = NSPredicate(format: "friend = %@", username)
        
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [predicate1, predicate2])


        fetchrequest.predicate = andPredicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray

            if result.count>0
            {
                let objectentity = result.firstObject as! Friends

                if objectentity.username == username
                {
                    print("User Exists")
                    return true
                }
                else
                {
                    print("User Does Not Exist")
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
    
    class func addFriend(friendUser:String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let friend:Friends = Friends(context: context)

        friend.username = currentUser.username
        friend.friend = friendUser

        do
                {
                    try context.save()
                    friendsArray.append(friend)
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
    }
    
    class func friendsList() -> Array<Friends>{
        return UserController.friendsArray
    }
    
    class func getCurrentUser() -> User{
        return UserController.currentUser
    }
    
    class func setCurrentUser(user: User) {
        UserController.currentUser = user
    }
}
