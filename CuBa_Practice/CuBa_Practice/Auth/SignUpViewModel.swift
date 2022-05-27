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
        let user = SignUpModel(email: email, password: password)
        guard let data = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        ApiService.apiCall(method: RequestMethod.post.rawValue, endPoint: TypeOfApi.register.rawValue, body: data,responseBody: SignUpResponseModel.self) { [weak self]result in
            guard let uSelf = self else {return}
            switch result {
            case .success(let data):
                uSelf.onLoginSuccess?()
                uSelf.onLoginResponseData?(SignUpResponseModel(id: data.id, token: data.token))
                
            case .failure(let error):
                uSelf.onLoginFailure?()
                uSelf.onLoginFailureData?(ErrorSignUpModel(error: error.error))
            }
        }
        
    }
}
