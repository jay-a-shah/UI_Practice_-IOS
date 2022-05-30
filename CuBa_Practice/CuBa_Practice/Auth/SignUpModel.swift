//
//  SignUpModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 27/05/22.
//

import Foundation

struct SignUpModel: Codable {
    let email: String
    let password: String
    let buisnessUrl: String
    let userName: String
    func requestParams() -> [String:Any] {
        var user : [String:Any] = [:]
        user["buisnessUrl"] = buisnessUrl
        user["userName"] = userName
        user["email"] = email
        user["password"] = password
        return user
    }
}

struct SignUpResponseModel: Codable {
    let id: Int
    let token: String
}

