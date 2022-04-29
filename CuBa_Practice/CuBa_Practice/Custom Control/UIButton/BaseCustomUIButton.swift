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
        self.layer.cornerRadius = CGFloat(Constants.SIX)
        self.backgroundColor = R.color.purpleColor()
        self.setTitleColor(R.color.gray(), for: .normal)
        self.titleLabel?.font = R.font.dmSansMedium(size: CGFloat(Constants.FOURTEEN))
    }
}
