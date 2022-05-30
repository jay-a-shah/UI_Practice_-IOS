//
//  SignInModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation

struct SignInModel: Codable {
    let email: String
    let password: String
    func requestParams() -> [String:Any]{
        var user : [String:Any] = [:]
        user["email"] = email
        user["password"] = password
        return user
    }
}

struct SignInResponseModel: Codable {
    let token: String
}

struct ErrorModel: Codable {
    let error: String
}
