//
//  BaseUILabel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//
import Foundation
import UIKit

class BaseUILabel: UILabel {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup(){
        self.font = UIFont.init(name: "DMSans-BoldItalic", size: 14)
        textColor = UIColor.grayColor
        
    }
}

