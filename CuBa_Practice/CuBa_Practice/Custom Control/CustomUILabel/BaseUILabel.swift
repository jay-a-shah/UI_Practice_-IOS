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
        self.font = R.font.dmSansMedium(size: CGFloat(Constants.FOURTEEN))
        textColor = R.color.gray()
    }
}

