//
//  LoginResponse.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: User?
}

struct User: Decodable {
    let userName: String?
    let userId: Int?
    let email: String?
}
