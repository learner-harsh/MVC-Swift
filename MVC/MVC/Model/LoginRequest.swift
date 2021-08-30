//
//  LoginRequest.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import Foundation

struct LoginRequest: Encodable {
    let email, password: String
}
