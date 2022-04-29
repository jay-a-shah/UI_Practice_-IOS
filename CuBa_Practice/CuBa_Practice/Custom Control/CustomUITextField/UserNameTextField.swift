//
//  CustomUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class UserNameTextField: BaseCustomUITextField {
    
    //It is called whenever textfield is added programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //It is called whenever textfield is added through Storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func setup() {
        super.setup()
        super.setUpImage(image: "Image_User", onSide: .left)
        super.setUpImage(image: "Icon_Right", onSide: .right)
        self.keyboardType = .emailAddress
        self.keyboardAppearance = .dark
    }
}
