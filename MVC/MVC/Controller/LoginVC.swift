//
//  LoginVC.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        userLogin()
    }
}

extension LoginVC: AlertProtocol {}

extension LoginVC {
    func userLogin() {
        let request = LoginRequest(email: txtFieldEmail.text!, password: txtFieldPassword.text!)
        let validation = LoginValidation()
        let validationResult = validation.validate(request: request)
        if validationResult.success {
            let resource = LoginResource()
            resource.loginUser(loginRequest: request) { [weak self] (response) in
                guard let response = response else {return}
                // Go To Next Controller
            }
        } else {
            showAlert(alertMessage: validationResult.errorMessage!)
        }
    }
}

//extension LoginVC {
//    func userLogin() {
//       if(txtFieldEmail.text!.count > 0 && txtFieldPassword.text!.count > 0){ // 1. Count check
//           if(validateEmail(value: txtFieldEmail.text!)){ // 2. Email validation
//               //3. Creating the request object
//               var urlRequest = URLRequest(url: URL(string: "http:/api/User/Login")!)
//               urlRequest.httpMethod = "post"
//               urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
//               let loginRequest = LoginRequest(email: txtFieldEmail.text!, password: txtFieldPassword.text!)
//               urlRequest.httpBody = try! JSONEncoder().encode(loginRequest)
//               //4. Making the API call
//               URLSession.shared.dataTask(with: urlRequest) { (responseData, urlResponse, networkError) in
//                   if (networkError == nil && responseData != nil) {
//                       let result = try! JSONDecoder().decode(LoginResponse.self, from: responseData!)
//                       if (result.data != nil) {
//                           //5. Navigate to a new view
//                       }
//                   } else {
//                       //6. Display network error alert
//                       self.showAlert(alertMessage: "Network error, please try again")
//                   }
//               }.resume()
//           } else {
//               //7. Display invalid email alert
//               showAlert(alertMessage: "Invalid email entered, please try again")
//           }
//       }else{
//           //8. Display empty text field alert
//           showAlert(alertMessage: "Please enter valid credentials to begin")
//       }
//   }
//
//   func validateEmail(value: String) -> Bool{
//       let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
//       return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
//   }
//}
