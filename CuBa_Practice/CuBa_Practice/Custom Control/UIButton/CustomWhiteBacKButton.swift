//
//  CustomWhiteBacKButton.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 05/05/22.
//

import Foundation
import UIKit

class CustomWhiteBacKButton: BaseCustomUIButton {
    
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
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.purpleColor, for: .normal)
    }
}
