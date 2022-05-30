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
        } else if !email.validateEmail() {
            onValidationError?("Email is Not Valid")
        } else if !password.validatePassword(){
            onValidationError?("Password is Not Valid")
        } else {
            apiCallSignInWithUrlSession(email, password)
        }
    }
    
    func apiCallSignInWithUrlSession(_ email: String, _ password: String) {
        let user = SignInModel(email: email, password: password)
        ApiService.apiCallAlamofire(baseUrl: Identifiers.BaseUrl.rawValue, endPoint: TypeOfApi.login.rawValue, method: .post, parameters: user.requestParams(), responseClass: SignInResponseModel.self) { result in
            switch result {
            case .success(let data):
                self.onLoginResponseData?(SignInResponseModel(token: data.token))
                break
            case .failure(let error):
                self.onLoginFailureData?(ErrorSignUpModel(error: error.error))
            }
        }
        
    }
}
