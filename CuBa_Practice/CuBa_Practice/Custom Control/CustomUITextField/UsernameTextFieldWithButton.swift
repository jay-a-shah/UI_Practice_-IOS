//
//  UsernameTextFieldWithButton.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import Foundation
import UIKit

class UsernameTextFieldWithButton: BaseCustomUITextField {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func setup() {
        super.setup()
        keyboardType = .emailAddress
        keyboardAppearance = .light
        returnKeyType = .next
        enablesReturnKeyAutomatically = true
        super.setUpImage(image: R.image.image_User.name, onSide: .left)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

