//
//  CustomUITextField.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import Foundation
import UIKit

class BaseCustomUITextField: UITextField {
    
    var textPadding = UIEdgeInsets(top: CGFloat(Constants.SIXTEEN), left: CGFloat(Constants.TWENTY), bottom: CGFloat(Constants.TWENTYFOUR), right: CGFloat(Constants.FOURTY))
    let bottomLine = CALayer()
    var label = UILabel()
    enum TextFieldImageSide {
        case left
        case right
    }
    
    override func becomeFirstResponder() -> Bool {
        bottomLine.backgroundColor = R.color.greenColor()?.cgColor
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        bottomLine.backgroundColor = R.color.neutralN20()?.cgColor
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
        bottomLine.frame = CGRect(x: CGFloat(Constants.ZERO), y: self.bounds.height + CGFloat(Constants.TEN), width: self.frame.width + CGFloat(Constants.FOURTY), height: CGFloat(Constants.TWO))
        self.borderStyle = UITextField.BorderStyle.none
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func setup() {
        setBottomLine()
        self.font = R.font.dmSansRegular(size: CGFloat(Constants.FOURTEEN))
        self.layer.cornerRadius = CGFloat(Constants.TEN)
        self.clipsToBounds = true
        self.layer.borderWidth = CGFloat(Constants.ZERO)
        self.backgroundColor = UIColor.white
        self.textColor = R.color.neutralLabelN800()
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor :UIColor.grayColor])
        self.enablesReturnKeyAutomatically = true
    }
    
    func setUpImage(image: String?, onSide: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: Constants.FIVE, y: Int(CGFloat(Constants.ZERO)), width: Constants.TWENTYTWO, height: Int(CGFloat(Constants.TWENTYTWO))))
        if let imageSystem = UIImage(systemName: image ?? R.image.blankImage.name){
            imageView.image = imageSystem
        }else {
            imageView.image = UIImage(named: image ?? R.image.blankImage.name)
        }
        let imageContainerView = UIView(frame: CGRect(x: Constants.FIVE, y: Int(CGFloat(Constants.ZERO)), width: Constants.THIRTY, height: Constants.THIRTY))
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
        let btnView = UIButton(frame: CGRect(x: CGFloat(Constants.ZERO), y: Double(Constants.FIFTY), width: ((self.frame.height) * Constants.POINTSEVENTY), height: ((self.frame.height) * Constants.POINTSEVENTY)))
        btnView.setTitle(btnTitle, for: .normal)
        btnView.setTitleColor(UIColor.purpleColor, for: .normal)
        btnView.titleLabel?.font = R.font.dmSansMedium(size: CGFloat(Constants.TWELVE))
        btnView.addTarget(nil, action: action, for: .touchUpInside)
        self.rightViewMode = .always
        self.rightView = btnView
    }
}
