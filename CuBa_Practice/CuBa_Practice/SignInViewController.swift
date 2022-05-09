//
//  SignInViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var userNameTextField: UsernameTextFieldWithButton!
    
    //MARK: - View LifeCyCle
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.setUpButton(btnTitle: R.string.localizable.btnForgotPassword(), action: #selector(pressed(_:)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround(viewController: self)
        turnOnSwipeToBack()
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default :
            break
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (userNameTextField.text != nil){
            userNameTextField.setUpImage(image: R.image.icon_Right.name, onSide: .right)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        userNameTextField.setUpImage(image: R.image.blankImage.name, onSide: .right)
    }
}

//MARK: - Objc Function
extension SignInViewController {
    
    @objc func pressed(_ sender: UIButton) {
        makealert(message: R.string.localizable.alertForgotPassword())
    }
    
    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + CGFloat(Constants.TEN)
        scrollView.contentInset = contentInset
    }
    
    @objc fileprivate func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

//MARK: - Outlet Action
extension SignInViewController {
    
    @IBAction func onClickOfSignInBtn(_ sender: UIButton) {
        makealert(message: R.string.localizable.alertSignIn())
    }
}

