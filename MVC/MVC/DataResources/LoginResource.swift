//
//  LoginResource.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import Foundation

struct LoginResource {
    func loginUser(loginRequest: LoginRequest, completion : @escaping (_ result: LoginResponse?) -> Void) {
        let loginUrl = URL(string: ApiEndpoints.login)!
        let httpUtility = HttpUtility()
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postApiData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self) { (loginApiResponse) in
                _ = completion(loginApiResponse)
            }
        } catch let error {
            debugPrint(error)
        }
    }
}
