//
//  ConfirmPassword_VC.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/16/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class ConfirmPassword_VC: UserAuth_VC {


   @IBOutlet weak var enterEmailContainerView: UIView!
  //-------------------------------------------------
   override func viewDidLoad() {
      super.viewDidLoad()
      currentForm = .ForgotPassword
    }
      
    //---Actions-------------------------------------
    @IBAction func signupLoginButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func skipButtonClicked(_ sender: Any) {
        self.goHome()
    }
}
