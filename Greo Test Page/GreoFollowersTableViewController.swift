//
//  GreoFollowersTableViewController.swift
//  Greo Test Page
//
//  Created by Julien Brinson on 6/9/17.
//  Copyright © 2017 Greo Inc. All rights reserved.
//

import UIKit

class GreoFollowersTableViewController: UITableViewController {

    private var DummyUsers = [My_Greo_User]()
    var followers = [My_Greo_User]()
    var prof_pics = [UIImage]()
    var display_user: My_Greo_User! {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    private func get_dummy_data(){
        let pic_names = ["Liz", "Julien", "Tre", "Brandon", "Moh", "Jess", "Sam"]
        for name in pic_names{
            prof_pics.append(UIImage(named:name)!)
        }
        
        let names:[String:UIImage] = ["Elizabeth Davis": prof_pics[0], "Tre Kirkman": prof_pics[2], "Brandon Hill": prof_pics[3], "Julien Brinson":prof_pics[1], "Sam Hinshelwood": prof_pics[6], "Moh Anelone":prof_pics[4], "Jessica Taylor":prof_pics[5]]
        var mottos = ["Your voice is so powerful. Use it", "Fight the power", "Down with the patriarchy", "We have nothing to lose but our chains", "Black Lives Matter", "Stay Woke", "Not a moment, but a movement"]
        var scores = [60, 70, 80, 100, 25, 50, 32]
        for (name, picture) in names{
            let new_dummy_user = My_Greo_User(user_name: name)
            new_dummy_user.add_prof_pic(picture: picture)
            new_dummy_user.add_motto(motto: mottos.removeFirst())
            new_dummy_user.add_greo_score(greo_score: scores.removeFirst())
            DummyUsers.append(new_dummy_user)
        }
        //add the followers to each dummyUser
        for dummy_user in DummyUsers {
            for follower in DummyUsers {
                if dummy_user.name != follower.name{
                    dummy_user.add_follower(new_follower: dummy_user)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get_dummy_data()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*needed for proper implementation. only need one section 
        */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DummyUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GreoFollowerTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GreoFollowerTableViewCell else{
            fatalError("The dequeued cell is not an instance of GreoFollowerTableViewCell")
        }

        // Configure the cell...
        let follower = display_user.followers[indexPath.row]
        
        cell.GreoName.text = follower.name
        cell.ProfPic.image = follower.picture
        cell.Followers_Followers.text = String(display_user.followers.count) + " Followers"
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
