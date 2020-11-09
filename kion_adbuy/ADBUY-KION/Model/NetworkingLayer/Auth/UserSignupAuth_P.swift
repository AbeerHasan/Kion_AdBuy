//
//  UserAuth_P.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/4/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

class UserSignupAuth_p {
    
     private weak var userAuth_view: UserAuth_view!
     
     init(userAuth_view: UserAuth_view) {
         self.userAuth_view = userAuth_view
     }
    
    //---------------------------------------------------
    // 422 handle a exisit email 
    func signup(firstName: String, lastName: String, email: String, password: String, mobile: String, comfirmPassword: String){
        userAuth_view.showProgressBar()
        Auth.shared.signUp(email:email, mobile: mobile, password: password, firstName: firstName, lastName: lastName, repeatPassword: comfirmPassword) { (result,type)  in
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
