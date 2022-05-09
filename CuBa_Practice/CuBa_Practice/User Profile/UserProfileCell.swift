//
//  UserProfileCell.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import UIKit

class UserProfileCell: UITableViewCell {

    @IBOutlet weak var subHeading: LightGrayUILabel!
    @IBOutlet weak var mainHeading: DarkGrayUILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
