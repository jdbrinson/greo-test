//
//  My_Greo_User.swift
//  Greo Test Page
//
//  Created by Julien Brinson on 6/9/17.
//  Copyright © 2017 Greo Inc. All rights reserved.
//

import UIKit

class My_Greo_User{
    var picture: UIImage!
    var name: String!
    var motto: String!
    var greo_score: Int!
    var followers = [My_Greo_User]()

    
    init(user_name: String){
        name = user_name
    }
    func add_prof_pic(picture: UIImage){
        self.picture = picture
    }
    func add_motto(motto: String){
        self.motto = motto
    }
    func add_greo_score(greo_score: Int){
        self.greo_score = greo_score
    }
    func add_follower(new_follower: My_Greo_User){
        followers.append(new_follower)
    }
}
    
