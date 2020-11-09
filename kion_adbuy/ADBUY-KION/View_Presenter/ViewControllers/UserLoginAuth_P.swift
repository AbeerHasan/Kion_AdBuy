//
//  UserLoginAuth_P.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/6/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation


class UserLoginauth_P {
    
    private weak var userAuth_view: UserAuth_view!
    
    init(userAuth_view: UserAuth_view) {
        self.userAuth_view = userAuth_view
    }
    
    func login(email: String, password: String) {
        userAuth_view.showProgressBar()
        Auth.shared.signIn(email: email, password: password) { (result,ErrTypes) in
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
