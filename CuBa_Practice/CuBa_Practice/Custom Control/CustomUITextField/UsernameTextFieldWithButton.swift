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
  
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func setup() {
        super.setup()
        keyboardType = .emailAddress
        keyboardAppearance = .light
        returnKeyType = .next
        super.setUpImage(image: "Image_User", onSide: .left)
       
    }
    override func becomeFirstResponder() -> Bool {
        setUpImage(image: "Icon_Right", onSide: .right)
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        setUpImage(image: nil, onSide: .right)
        return super.resignFirstResponder()
    }
}

