//
//  SignInViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation
struct SignInModel: Codable {
    let email: String
    let password: String
}

struct ErrorModel: Codable {
    let error: String
}

class SignInViewModel: BaseViewModel{
    
    var onValidationError: ((String)-> Void)?
    var onLoginSuccess: (()->Void)?
    func validateData(email: String,password: String) {
        if email.isEmpty {
            onValidationError?("Email is Empty")
        } else if password.isEmpty {
            onValidationError?("Password is Empty")
        } else if !validateEmail(email){
            onValidationError?("Email is Not Valid")
        } else if !validatePassword(password){
            onValidationError?("Password is Not Valid")
        } else {
            apiCallWithUrlSession(email: email, password: password)
        }
    }

    func validateEmail(_ YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
    
    func validatePassword(_ password: String) -> Bool {
        if password.count < 8 {
            return false
        }
        return false
    }
    func apiCallWithUrlSession(email: String,password: String) {
        let user = SignInModel(email: email, password: password)
        guard let data = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
    }
    
}
