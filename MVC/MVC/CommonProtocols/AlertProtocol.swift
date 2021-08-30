//
//  AlertProtocol.swift
//  MVC
//
//  Created by Harsh Jaiswal on 29/08/21.
//

import Foundation
import UIKit

protocol AlertProtocol where Self: UIViewController {
    func showAlert(alertMessage: String)
}

extension AlertProtocol {
    func showAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message:alertMessage , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
