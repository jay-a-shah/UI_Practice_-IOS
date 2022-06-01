//
//  SignInScreenViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignUpScreenViewController: BaseViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var businessTextField: BuisnessUrlTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var userNameTextField: UserNameTextField!
    
    //MARK: - Variables
    let viewModel = SignUpViewModel()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

//MARK: - UITextFieldDelegate
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

//MARK: - Bind ViewModel
extension SignUpScreenViewController {
    
    func bindViewModel() {
        let user = SignUpModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", buisnessUrl: businessTextField.text ?? "", userName: userNameTextField.text ?? "")
        viewModel.onValidationError = {error in
            if (error == "Success") { self.setUpProgressBar() } else { self.makealert(message: error) }
        }
        viewModel.onLoginSuccess = {
            self.viewModel.onLoginResponseData = {response in
                DispatchQueue.main.async {
                    self.endProgressBar()
                    print(String(response.id) + response.token)
                    if let userProfileVC = UIStoryboard(name: Identifiers.userProfileStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifiers.userProfileViewController.rawValue) as? UserProfileViewController {
                        self.navigationController?.pushViewController(userProfileVC, animated: true)
                    }
                }
            }
        }
        viewModel.onLoginFailure = {
            self.viewModel.onLoginFailureData = {failure in
                DispatchQueue.main.async {
                    self.endProgressBar()
                    self.makealert(message: failure.error)
                }
            }
        }
    }
    
}

//MARK: - Custom Functions
extension SignUpScreenViewController {
    
    private func initialSetup() {
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
    
}

//MARK: - Outlet Action
extension SignUpScreenViewController {
    
    @IBAction func onClickOfBtnSignUp(_ sender: Any) {
        viewModel.validateData(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", userName: userNameTextField.text ?? "", buisnessUrl: businessTextField.text ?? "")
    }
    
    @IBAction func onClickOFAlreadyHaveAnAccountBtn(_ sender: Any) {
        if let signInVC = UIStoryboard(name: Identifiers.mainStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier:Identifiers.tabBarController.rawValue ) as? TabBarController {
            self.navigationController?.pushViewController(signInVC, animated: true)
        }
    }
    
}

//MARK: - Objc Function
extension SignUpScreenViewController {
    
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
