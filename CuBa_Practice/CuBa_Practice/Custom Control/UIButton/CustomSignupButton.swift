//
//  CustomSignupButton.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//
import UIKit
import Foundation

class CustomSignupButton: BaseCustomUIButton {
    
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
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.purpleColor
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle("Sign Up", for: .normal)
        
        
    }
}
