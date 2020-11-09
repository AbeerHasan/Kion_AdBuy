//
//  ViewController.swift
//  ADBUY-KION
//
//  Created by alaa salama on 8/29/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit
enum FormName: String {
    case Login = "Login"
    case Signup = "Signup"
    case ForgotPassword = "Forget Password"
}
var currentForm = FormName.Signup

class SignupContaner_VC: UserAuth_VC{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    //---Actions----------------------------------
    
    @IBAction func skipButtonClicked(_ sender: Any) {
         self.goHome()
    }
}

