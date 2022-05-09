//
//  EmailTextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import Foundation
import UIKit

class EmailTextField: BaseCustomUITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func setup() {
        super.setup()
        keyboardType = .emailAddress
        keyboardAppearance = .light
        returnKeyType = .next
        super.setUpImage(image: R.image.icon_Email.name, onSide: .left)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}
