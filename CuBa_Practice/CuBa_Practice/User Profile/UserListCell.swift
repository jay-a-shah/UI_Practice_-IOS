//
//  UserListCell.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 01/06/22.
//

import UIKit

class UserListCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var firstNamelbl: UILabel!
    @IBOutlet weak var emailAddresslbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(firstName: String, email: String, image: String){
        self.emailAddresslbl.text = email
        self.firstNamelbl.text = firstName
        if let urlImage = URL(string: image ?? ""){
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: urlImage) else{return}
                DispatchQueue.main.async {
                    self.profilePhoto.image = UIImage(data: imageData)
                    
                }
                
            }
        }
    }
}
