//
//  UserResetPassword.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/18/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation


class UserResetPassword_P {
    private weak var userAuth_view: UserAuth_view!
     
     init(userAuth_view: UserAuth_view) {
         self.userAuth_view = userAuth_view
     }
    
    func resetPasswordWithEmail(email:String) {
        userAuth_view.showProgressBar()
        Auth.shared.resetPasswordWithEmail(email: email) { (result) in
            switch result {
            case .success(_):
                self.userAuth_view.showSuccess()
                self.userAuth_view.hideProgressBar()
            case .failure(let error):
                  self.userAuth_view.showError(error: error.userInfo![NSLocalizedDescriptionKey] as? String ?? "Error")
                  self.userAuth_view.hideProgressBar()
            }
        }
    }
}
