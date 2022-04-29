//
//  CustomUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class BaseCustomUITextField: UITextField {
   
    var textPadding = UIEdgeInsets(top: 12, left: 40, bottom: 12, right: 40)
    let bottomLine = CALayer()
    enum TextFieldImageSide {
        case left
        case right
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
        bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + 10, width: self.frame.width + 40, height: 2.0)
        self.borderStyle = UITextField.BorderStyle.none
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func setup(){
        setBottomLine()
        self.delegate = self
        self.font = UIFont.init(name: "DMSans-Regular", size: 14)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 0
        self.backgroundColor = UIColor.white
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor :UIColor.grayColor])
    }
    func setUpImage(image: String, onSide: TextFieldImageSide){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: 30))
        if let imageSystem = UIImage(systemName: image){
            imageView.image = imageSystem
        }else {
            imageView.image = UIImage(named: image)
        }
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
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
    func setUpButton(btnTitle: String){
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * 0.70), height: ((self.frame.height) * 0.70)))
        btnView.setTitle(btnTitle, for: .normal)
        btnView.setTitleColor(UIColor.purpleColor, for: .normal)
        btnView.titleLabel?.font = UIFont(name: "DMSans-Regular", size: 12)
        self.rightViewMode = .always
        self.rightView = btnView
    }
    
}
extension BaseCustomUITextField : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomLine.backgroundColor = UIColor.green.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomLine.backgroundColor = UIColor.gray.cgColor
    }
}
