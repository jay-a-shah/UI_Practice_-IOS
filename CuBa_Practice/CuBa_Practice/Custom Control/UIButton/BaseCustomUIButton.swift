//
//  BaseCustomUIButton.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
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
        let height = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 44)
        let width = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 305)
        self.addConstraints([height,width])
    }
}
