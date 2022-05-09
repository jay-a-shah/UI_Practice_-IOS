//
//  SignInScreenViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import UIKit

class SignUpScreenViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var businessTextField: BuisnessUrlTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: PasswordUITextField!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var userNameTextField: UserNameTextField!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        businessTextField.delegate = self
        emailTextField.delegate = self
        userNameTextField.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround(viewController: self)
        turnOnSwipeToBack()
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text != nil){
            emailTextField.setUpImage(image: R.image.icon_Right.name, onSide: .right)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailTextField.setUpImage(image: R.image.blankImage.name, onSide: .right)
    }
}

//MARK: - Objc Function
extension SignUpScreenViewController {
    
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
extension SignUpScreenViewController {
    
    @IBAction func onClickOFAlreadyHaveAnAccountBtn(_ sender: Any) {
        makealert(message: R.string.localizable.btnAlreadyHaveAccount())
    }
    
    @IBAction func onClickOfSignUpButton(_ sender: CustomSignupButton) {
        makealert(message: R.string.localizable.alertSignUp())
    }
}
