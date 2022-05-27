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
}

struct SignUpResponseModel: Codable {
    let id: Int
    let token: String
}

