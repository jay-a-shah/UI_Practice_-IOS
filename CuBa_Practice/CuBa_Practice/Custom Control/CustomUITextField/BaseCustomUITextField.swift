//
//  CustomUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class BaseCustomUITextField: UITextField {
   
    var textPadding = UIEdgeInsets(top: 16, left: 20, bottom: 14, right: 40)
    let bottomLine = CALayer()
    var label = UILabel()
    enum TextFieldImageSide {
        case left
        case right
    }
    
    override func becomeFirstResponder() -> Bool {
        bottomLine.backgroundColor = UIColor.greenColor.cgColor
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        return super.resignFirstResponder()
    }
    
    //This Padding will be given when text is there
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    //This padding will be given when text will be in editing mode
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    //It is called whenever textfield is added programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //It is called whenever textfield is added through Storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func setBottomLine() {
        bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + 6, width: self.frame.width + 40, height: 2.0)
        self.borderStyle = UITextField.BorderStyle.none
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func setup() {
        setBottomLine()
        self.font = UIFont.init(name: "DMSans-Regular", size: 14)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 0
        self.backgroundColor = UIColor.white
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor :UIColor.grayColor])
        self.enablesReturnKeyAutomatically = true
    }

    func setUpImage(image: String?, onSide: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 22, height: 22))
        if let imageSystem = UIImage(systemName: image ?? "BlankImage"){
            imageView.image = imageSystem
        }else {
            imageView.image = UIImage(named: image ?? "BlankImage")
        }
        let imageContainerView = UIView(frame: CGRect(x: 5, y: 0, width: 30, height: 30))
        imageContainerView.addSubview(imageView)
        switch onSide {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
    
    func setUpButton(btnTitle: String, action: Selector) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * 0.70), height: ((self.frame.height) * 0.70)))
        btnView.setTitle(btnTitle, for: .normal)
        btnView.setTitleColor(UIColor.purpleColor, for: .normal)
        btnView.titleLabel?.font = UIFont(name: "DMSans-Medium", size: 12)
        btnView.addTarget(nil, action: action, for: .touchUpInside)
        self.rightViewMode = .always
        self.rightView = btnView
    }
}

