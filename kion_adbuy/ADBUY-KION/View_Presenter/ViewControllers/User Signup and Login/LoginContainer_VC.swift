//
//  LoginContainer_VC.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/24/20.
//  Copyright © 2020 KION. All rights reserved.
//

import UIKit

class LoginContainer_VC: UserAuth_VC{

    override func viewDidLoad() {
        super.viewDidLoad()
        currentForm = .Login
        
    }

    @IBAction func signupButtonClicked(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func skipButtonClicked(_ sender: Any) {
        self.goHome()
    }
}
