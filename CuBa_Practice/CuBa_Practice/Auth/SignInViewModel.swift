//
//  SignInViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation


class SignInViewModel: NSObject {
    
    var onValidationError: ((String)-> Void)?
    var onLoginSuccess: (()->Void)?
    var onLoginFailure: (()->Void)?
    var onLoginResponseData: ((SignInResponseModel)->Void)?
    var onLoginFailureData: ((ErrorSignUpModel)-> Void)?
    
    func validateData(email: String, password: String) {
        if email.isEmpty {
            onValidationError?("Email is Empty")
        } else if password.isEmpty {
            onValidationError?("Password is Empty")
        } else if !validateEmail(email) {
            onValidationError?("Email is Not Valid")
        } else if validatePassword(password) {
            onValidationError?("Password is Not Valid")
        } else {
            apiCallSignInWithUrlSession(email, password)
        }
    }
    
    func validateEmail(_ yourEmailAddress: String) -> Bool {
        let regex: String
        regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: yourEmailAddress)
    }
    
    func validatePassword(_ password: String) -> Bool {
        if password.count < 8 {
            return false
        }
        return false
    }
    
    
    func apiCallSignInWithUrlSession(_ email: String, _ password: String) {
        let user = SignInModel(email: email, password: password)
        guard let data = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        ApiService.apiCall(method: RequestMethod.post.rawValue, endPoint: TypeOfApi.login.rawValue, body: data,responseBody: SignInResponseModel.self) { [weak self]result in
            guard let uSelf = self else {return}
            switch result {
            case .success(let data):
                uSelf.onLoginResponseData?(SignInResponseModel(token: data.token))
                
            case .failure(let error):
                uSelf.onLoginFailure?()
                
            }
        }
        
    }
}
