//
//  SignInScreenViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignUpScreenViewController: UIViewController {


    @IBOutlet weak var businessTextField: BuisnessUrlTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var userNameTextField: UserNameTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        businessTextField.delegate = self
        emailTextField.delegate = self
        userNameTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
            guard let userInfo = notification.userInfo else { return }
            var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 10
            scrollView.contentInset = contentInset
        }
    @objc fileprivate func keyboardWillHide(notification:NSNotification) {
            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }
    @IBAction func AlreadyHaveAnAccountBtn(_ sender: Any) {
        makealert(Message: "Already Have an Account Please Sign In")
    }
    //    @IBAction func signUpAction(_ sender: UIButton) {
//        makealert(Message: "Sign Up Button Is Clicked")
//    }
}
extension SignUpScreenViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            businessTextField.becomeFirstResponder()
        case businessTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default :
            break
        }
        return true
    }
}
