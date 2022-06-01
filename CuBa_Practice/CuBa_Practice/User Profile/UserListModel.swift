//
//  UserListModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 01/06/22.
//

import Foundation

struct UserList: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [UserListData]
    let support: Support
}
struct UserListData: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
struct Support: Codable {
    let url: String
    let text: String
}
