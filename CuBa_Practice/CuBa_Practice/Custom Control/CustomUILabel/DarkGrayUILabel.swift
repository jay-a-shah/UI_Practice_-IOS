//
//  DarkGrayUILabel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import Foundation
import UIKit

class DarkGrayUILabel: BaseUILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func setup(){
        super.setup()
        self.font = UIFont.init(name: "DMSans-Medium", size: 14)
        textColor = UIColor.DarkPurple
        
    }
    
}
