//
//  PasswordUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class PasswordUITextField: BaseCustomUITextField{
    
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
        keyboardType = .asciiCapable
        keyboardAppearance = .dark
        isSecureTextEntry = true
        returnKeyType = .done
        super.setUpImage(image: "Icon_Lock", onSide: .left)
        super.setUpButton(btnTitle: "Forgot ?")
    }
    
}
