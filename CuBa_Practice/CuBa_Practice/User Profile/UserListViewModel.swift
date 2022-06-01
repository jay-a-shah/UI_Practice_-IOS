//
//  UserListViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 01/06/22.
//

import Foundation

class UserListViewModel: NSObject {
    
    //MARK: - Outlets
    var onLoginResponseData: ((UserList)->Void)?
    var onLoginFailureData: ((ErrorSignUpModel)-> Void)?
    
    //MARK: - Functions
    func apiCallUserList() {
        ApiService.apiCallAlamofire(baseUrl: Identifiers.BaseUrl.rawValue, endPoint: TypeOfApi.userList.rawValue, method: .get, parameters: nil, responseClass: UserList.self) { response in
            switch response{
            case .success(let data):
                self.onLoginResponseData?(data)
                break
            case.failure(let error):
                self.onLoginFailureData?(error)
                break
            }
    
        }
    }
}
