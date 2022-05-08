//
//  SignInViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var userNameTextField: EmailTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        passwordTextField.setUpButton(btnTitle: "Forgot?", action: #selector(pressed(_:)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround(viewController: self)
    }
    @IBAction func onClickOfSignInBtn(_ sender: UIButton) {
        if let userProfileVC = UIStoryboard(name: "UserProfile", bundle: nil).instantiateViewController(withIdentifier: Identifiers.userProfileViewController.rawValue) as? UserProfileViewController {
            self.navigationController?.pushViewController(userProfileVC, animated: true)
                }
            }
}
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
}
extension SignInViewController {
    @objc func pressed(_ sender: UIButton) {
        makealert(message: "You Forgot the Password")
    }
}
extension SignInViewController {
    
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
    
}
