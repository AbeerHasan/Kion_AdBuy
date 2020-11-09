//
//  Signup_VC.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit
import IQKeyboardManager

class Signup_VC: UserAuth_VC, UserAuth_view{
 
    //---Outlets -----------------------------------
    @IBOutlet weak var signUpButton: CustomizedButton!
    @IBOutlet weak var signInButton: CustomizedButton!
   
    @IBOutlet weak var firstNameInputText: CustomizedTextField!
    @IBOutlet weak var lastNameInputText: CustomizedTextField!
    @IBOutlet weak var emailInputText: CustomizedTextField!
    @IBOutlet weak var phoneInputText: CustomizedTextField!
    @IBOutlet weak var passwordInputText: CustomizedTextField!
    @IBOutlet weak var confirmPasswordInputText: CustomizedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //---Variables ---------------------------------
    var presenter : UserSignupAuth_p!
    
    //--- ViewDidLoad ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityIndicator.isHidden = true
       
        presenter = UserSignupAuth_p(userAuth_view: self)
    }
    
    //--- Actions-----------------------------------
    @IBAction func signupButtonClicked(_ sender: Any) {
      
        if checkAllFieldVlidation() == ""{
            presenter.signup(firstName: firstNameInputText.text!, lastName: lastNameInputText.text!,
                         email: emailInputText.text!, password: passwordInputText.text!,
                         mobile: phoneInputText.text!, comfirmPassword: confirmPasswordInputText.text!)
        }else {
            let errorXIB = Error_VC_xib()
            errorXIB.modalPresentationStyle = .overCurrentContext
            present(errorXIB, animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name("Error"), object: checkAllFieldVlidation())
        }
    }
    
    
    //--- Signup Auth---------------------------------
   func showProgressBar() {
        self.startSpinning(spenner: activityIndicator)
    }
            
   func hideProgressBar() {
        self.stopSpinning(spenner: activityIndicator)
   }
   
   func showSuccess() {
        self.goHome()
   }
       
   func showError(error: String) {
        self.showAllertMessage(allertTitle: "Something Wrong", error: error, actionTitle: "Dismiss")
   }
    
   //--- Validation ----------------------------------
   func checkAllFieldVlidation() -> String {
        let fields: [CustomizedTextField] = [ firstNameInputText, lastNameInputText, emailInputText, phoneInputText, passwordInputText, confirmPasswordInputText]
        var errorFields: [CustomizedTextField] = []
               var error = ""
               
               for field in fields {
                  if field.getError() != "" {
                   errorFields.append(field)
                  }
               }
               
        if confirmPasswordInputText.text != passwordInputText.text && confirmPasswordInputText.text != ""{
            confirmPasswordInputText.showErrorWorning()
            confirmPasswordInputText.setError(error: "Confirm password dosn't match password field")
            errorFields.append(confirmPasswordInputText)
        }
        if errorFields.count != 0 {
            error = errorFields[0].getError()
            for field in errorFields {
                field.showErrorWorning()
            }
        }
        return error
    }

}

