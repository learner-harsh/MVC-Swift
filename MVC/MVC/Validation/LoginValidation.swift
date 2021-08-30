//
//  LoginValidation.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import Foundation
struct LoginValidation  {
    func validate(request: LoginRequest) -> LoginValidationResult {
        if(request.email.count > 0 && request.password.count > 0) {
            if (request.email.validateEmail()) {
                return LoginValidationResult(success: true, errorMessage: nil)
            } else {
                return LoginValidationResult(success: false, errorMessage: "Please enter a valid email")
            }
        }
        return LoginValidationResult(success: false, errorMessage: "Please enter valid credentials")
    }
}
