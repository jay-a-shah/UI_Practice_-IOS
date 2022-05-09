//
//  PasswordUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class PasswordUITextField: BaseCustomUITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func setup() {
        super.setup()
        keyboardType = .asciiCapable
        keyboardAppearance = .light
        isSecureTextEntry = true
        returnKeyType = .done
        super.setUpImage(image: R.image.icon_Lock.name, onSide: .left)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}
