//
//  GreoFollowerTableViewCell.swift
//  Greo Test Page
//
//  Created by Julien Brinson on 6/8/17.
//  Copyright © 2017 Greo Inc. All rights reserved.
//

import UIKit

class GreoFollowerTableViewCell: UITableViewCell {
    @IBOutlet weak var GreoName: UILabel!

    @IBOutlet weak var Followers_Followers: UILabel!
    
    @IBOutlet weak var ProfPic: UIImageView!
    @IBOutlet weak var Follow_Status: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
