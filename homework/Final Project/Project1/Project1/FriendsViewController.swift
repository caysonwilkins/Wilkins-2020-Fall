//
//  FriendsViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 12/13/20.
//

import UIKit
import CoreData

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
            tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserController.friendsList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell")

        let currentFriend = UserController.friendsList()[indexPath.row]
        cell?.textLabel?.text = currentFriend.friend

                return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(friendsListWasUpdated(notification:)), name: NSNotification.Name("NEW_FRIEND"), object: nil)

        
        UserController.fetchFriendsData()

    }
    
    @IBAction func saveOnClick(_ sender: Any) {
        let alert = UIAlertController(title: "Add Friend", message: "Type friend's username below and click 'Ok'", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Username"
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
            guard let alert = alert, let textField = alert.textFields?.first else { return }
            
            //add friend here
            if (!UserController.CheckForUserName(username: textField.text!)) {
                let alert1 = UIAlertController(title: "Invalid User", message: "That username doesn't exist", preferredStyle: .alert)
                let cancel1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert1.addAction(cancel1)
                self.present(alert1, animated: true, completion: nil)
            }
            
            else if (UserController.CheckForFriend(username: textField.text!)) {
                let alert2 = UIAlertController(title: "Already Added", message: "That friend is already on your friend's list", preferredStyle: .alert)
                let cancel2 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert2.addAction(cancel2)
                self.present(alert2, animated: true, completion: nil)
            }
            
            else {
                UserController.addFriend(friendUser: textField.text!)
                NotificationCenter.default.addObserver(self, selector: #selector(self.friendsListWasUpdated(notification:)), name: NSNotification.Name("NEW_FRIEND"), object: nil)
                UserController.fetchFriendsData()
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
    }
    
    @objc
        func friendsListWasUpdated(notification:Notification) {
            UserController.fetchFriendsData()
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
