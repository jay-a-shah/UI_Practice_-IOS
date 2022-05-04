//
//  BuisnessUrlTextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import Foundation
import UIKit

class BuisnessUrlTextField: BaseCustomUITextField{
    
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
        keyboardType = .URL
        keyboardAppearance = .light
        returnKeyType = .next
        super.setUpImage(image: "Icon_Globe", onSide: .left)
    }
}
