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
    @IBOutlet weak var userNameTextField: EmailTextField!
    @IBOutlet weak var signInBtn: UIView!
    let viewModel = SignInViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        passwordTextField.setUpButton(btnTitle: "Forgot?", action: #selector(pressed(_:)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardWhenTappedAround(viewController: self)
        bindViewModel()
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
}

//MARK: - Objc Function
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
    
    @objc func pressed(_ sender: UIButton) {
        makealert(message: "You Forgot the Password")
    }
}

//MARK: - Outlet Action
extension SignInViewController {
    
    @IBAction func onClickOfSignInBtn(_ sender: UIButton) {
        viewModel.validateData(email: userNameTextField.text ?? "", password: passwordTextField.text ??  "")
    
    }
}

//MARK: - Bind ViewModel
extension SignInViewController {
    
    func bindViewModel() {
        let user = SignInModel(email: userNameTextField.text ?? "", password: passwordTextField.text ?? "")
        viewModel.onValidationError = {error in
            self.makealert(message: error)
        }
        viewModel.onLoginResponseData = { response in
            DispatchQueue.main.async {
                
                self.makealert(message: response.token)
                if let userProfileVC = UIStoryboard(name: Identifiers.userProfileStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifiers.userProfileViewController.rawValue) as? UserProfileViewController {
                    self.navigationController?.pushViewController(userProfileVC, animated: true)
                }
            }
        }
        viewModel.onLoginFailureData = {failure in
            DispatchQueue.main.async {
                self.makealert(message: failure.error)
            }
        }
        
        
    }
}

