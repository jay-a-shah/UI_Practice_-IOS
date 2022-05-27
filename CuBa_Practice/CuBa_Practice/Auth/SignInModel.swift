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
}

struct SignInResponseModel: Codable {
    let token: String
}

struct ErrorModel: Codable {
    let error: String
}
