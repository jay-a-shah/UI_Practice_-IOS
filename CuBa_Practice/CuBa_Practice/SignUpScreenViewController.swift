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
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        businessTextField.delegate = self
        emailTextField.delegate = self
        userNameTextField.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround(viewController: self)
        bindViewModel()
    }
    @IBAction func onClickOfBtnSignUp(_ sender: Any) {
        viewModel.validateData(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", userName: userNameTextField.text ?? "", buisnessUrl: businessTextField.text ?? "")
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
    @IBAction func onClickOFAlreadyHaveAnAccountBtn(_ sender: Any) {
        if let signInVC = UIStoryboard(name: Identifiers.mainStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier:Identifiers.signInViewController.rawValue ) as? SignInViewController {
            self.navigationController?.pushViewController(signInVC, animated: true)
        }
    }
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

extension SignUpScreenViewController {
    
    func bindViewModel() {
        let user = SignUpModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        viewModel.onValidationError = {error in
            self.makealert(message: error)
        }
        viewModel.onLoginSuccess = {
            self.viewModel.onLoginResponseData = {response in
                DispatchQueue.main.async {
                    self.makealert(message: String(response.id) + response.token )
                    if let userProfileVC = UIStoryboard(name: Identifiers.userProfileStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifiers.userProfileViewController.rawValue) as? UserProfileViewController {
                        self.navigationController?.pushViewController(userProfileVC, animated: true)
                    }
                }
            }
        }
        viewModel.onLoginFailure = {
            self.viewModel.onLoginFailureData = {failure in
                DispatchQueue.main.async {
                    self.makealert(message: failure.error)
                }
            }
        }
        
    }
}
