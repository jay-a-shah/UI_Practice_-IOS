//
//  SignInViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var userNameTextField: EmailTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
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
