//
//  AlertManager .swift
//  Login-System
//
//  Created by Акмарал Тажиева on 09.11.2022.
//

import UIKit


class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
   
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmis", style: .default))
            vc.present(alert, animated: true)
        }
    }
    
}
 // MARK: - Show Validation Alerts
extension AlertManager {
    
    public static func showInvalidEmail(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid email", message: "Please enter a valid email.")
    }
    
    public static func showInvalidPassword(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password.")
    }
    
    public static func showInvalidUsername(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid username.")
    }
    
}

 // MARK: - Registration Errors
extension AlertManager {
    public static func showRegistrationError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown registration error.", message: nil)
    }
    public static func showRegistrationError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown registration error.", message: "\(error.localizedDescription)")
    }
}

// MARK: - Log In Errors
extension AlertManager {
   public static func showSignInError(on vc: UIViewController) {
       self.showBasicAlert(on: vc, title: "Unknown Error Signing In.", message: nil)
   }
    
    public static func showSignInError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Signing In.", message: "\(error.localizedDescription)")
    }
}

// MARK: - Log out  Errors
extension AlertManager {
   public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Log Out Error.", message: "\(error.localizedDescription)")
    }
}

// MARK: - Forgot Password
extension AlertManager {
    
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset Sent.", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Sending Password Reset.", message: "\(error.localizedDescription)")
    }
}

 // MARK: - Fetching User Errors
extension AlertManager {
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching User.", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Erroro Fetching User.", message: nil)
    }
}
