//
//  SignUpViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 27/05/22.
//

import Foundation

class SignUpViewModel: NSObject {
    
    var onValidationError: ((String)-> Void)?
    var onLoginSuccess: (()->Void)?
    var onLoginFailure: (()->Void)?
    var onLoginResponseData: ((SignUpResponseModel)->Void)?
    var onLoginFailureData: ((ErrorSignUpModel)-> Void)?
    
    func validateData(email: String, password: String, userName: String, buisnessUrl: String) {
        if email.isEmpty || password.isEmpty || userName.isEmpty || buisnessUrl.isEmpty {
            onValidationError?("Some Credentials are Empty")
        } else if !email.validateEmail() {
            onValidationError?("Email is Not Valid")
        } else if !password.validatePassword() {
            onValidationError?("Password is Not Valid")
        } else {
           apiCallSignUpWithUrlSession(email, password, userName, buisnessUrl)
        }
    }
    
    func apiCallSignUpWithUrlSession(_ email: String, _ password: String, _ userName: String, _ buisnessUrl:String) {
        let user = SignUpModel(email: email, password: password, buisnessUrl: buisnessUrl, userName: userName)
        ApiService.apiCallAlamofire(baseUrl: Identifiers.BaseUrl.rawValue, endPoint: TypeOfApi.register.rawValue, method: .post, parameters: user.requestParams(), responseClass: SignUpResponseModel.self) { result in
            switch result {
            case .success(let data):
                self.onLoginSuccess?()
                self.onLoginResponseData?(SignUpResponseModel(id: data.id, token: data.token))
                break
            case .failure(let error):
                self.onLoginFailure?()
                self.onLoginFailureData?(ErrorSignUpModel(error: error.error))
            }
        }
        
    }
}
