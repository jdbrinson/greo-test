//
//  ViewController.swift
//  Greo Test Page
//
//  Created by Julien Brinson on 6/8/17.
//  Copyright © 2017 Greo Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var ProfileMotto: UILabel!
    @IBOutlet weak var ProfileGreoScore: UILabel!
    @IBOutlet weak var GreoFollowers: UITableView!
    @IBOutlet weak var Profile_Followers: UILabel!
    @IBOutlet weak var Background: UIImageView!
    
    private var DisplayProfile: My_Greo_User!{
        didSet {
            
            self.GreoFollowers.reloadData()
        }
    }
    
    
    private var DummyUsers = [My_Greo_User]()
    var followers = [My_Greo_User]()
    var prof_pics = [UIImage]()
//    var display_user: My_Greo_User! {
//        didSet {
//            GreoFollowers.reloadData()
//        }
//    }
    private func get_dummy_data(){
        let pic_names = ["Liz", "Julien", "Tre", "Brandon", "Moh", "Jess", "Sam"]
        for name in pic_names{
            prof_pics.append(UIImage(named:name)!)
        }
        
        let names:[String:UIImage] = ["Elizabeth Davis": prof_pics[0], "Tre Kirkman": prof_pics[2], "Brandon Hill": prof_pics[3], "Julien Brinson":prof_pics[1], "Sam Hinshelwood": prof_pics[6], "Moh Anelone":prof_pics[4], "Jessica Taylor":prof_pics[5]]
        var mottos = [ "Fight the power", "Down with the patriarchy", "We have nothing to lose but our chains", "Black Lives Matter", "Stay Woke", "Not a moment, but a movement", "Your voice is so powerful. Use it"]
        var scores = [70, 80, 100, 25, 50, 32, 60]
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
                    dummy_user.add_follower(new_follower: follower)
                }
            }
        }
        
    }
    
    
    
    
    /* small class that will store the data needed from a larger Greo class */
    
    

    
    
    /*function that extracts data from a large Greo class into my_Greo_user for this sample */
    private func get_profile_data(realGreo :My_Greo_User ){
        let user = My_Greo_User(user_name: realGreo.name)
        user.add_prof_pic(picture: realGreo.picture)
        user.add_motto(motto: realGreo.motto)
        user.add_greo_score(greo_score: realGreo.greo_score)
        for follower in realGreo.followers{
            user.add_follower(new_follower: follower)
        }
        DisplayProfile = user
        
        
    }
    
    private func display_profile(){
        ProfilePic.image = DisplayProfile.picture
        Background.image = DisplayProfile.picture
        ProfileName.text = DisplayProfile.name
        ProfileMotto.text = DisplayProfile.motto
        ProfileGreoScore.text = "GREO SCORE: " + String(DisplayProfile.greo_score)
        Profile_Followers.text = String(DisplayProfile.followers.count) + "\n followers"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        GreoFollowers.delegate = self
        GreoFollowers.dataSource = self
        get_dummy_data()
        DisplayProfile = DummyUsers[0]
        display_profile()
        
        
        // initialize a GreoFollowersTableViewController
        
        
        // set its display_user to be the one you get from get_profile_data
        // set GreoFollowers to be the view of the GreoFollowersTableViewController
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DisplayProfile.followers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GreoFollowerTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GreoFollowerTableViewCell else{
            fatalError("The dequeued cell is not an instance of GreoFollowerTableViewCell")
        }
        
        // Configure the cell...
        let follower =   DisplayProfile.followers[indexPath.row] //display_user.followers[indexPath.row]
        
        cell.GreoName.text = follower.name
        cell.ProfPic.image = follower.picture
        cell.Followers_Followers.text = String(DisplayProfile.followers.count) + " Followers"
        
        return cell
    }
    
    
    
    
    
    class GreoList{
        var listOfNames = ["Elizabeth Davis", "Tre Kirkman", "Brandon Hill", "Julien Brinson", "Sam Hinshelwood", "Moh Anelone", "Jessica Taylor"]
        
    }

    

}

