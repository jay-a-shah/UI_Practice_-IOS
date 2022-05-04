//
//  BaseCustomUIButton.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import Foundation
import UIKit

class BaseCustomUIButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup(){
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.purpleColor
        self.setTitleColor(UIColor.grayColor, for: .normal)
        self.titleLabel?.font = UIFont(name: "DMSans-Medium", size: 14)
    }
}
