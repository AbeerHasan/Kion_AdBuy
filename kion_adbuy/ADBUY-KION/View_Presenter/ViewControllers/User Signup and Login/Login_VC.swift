//
//  Login_VC.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class Login_VC: UserAuth_VC, UserAuth_view{
 
 
    //---- Outlets--------------------
    @IBOutlet weak var loginButton: CustomizedButton!
    
    @IBOutlet weak var emailInputText: CustomizedTextField!
    @IBOutlet weak var passwordInputText: CustomizedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //--- Variables ------------------
    var presenter : UserLoginauth_P!
    
    //--------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = UserLoginauth_P(userAuth_view: self)

        activityIndicator.isHidden = true
    }

    //--- Actions --------------------------------
    @IBAction func loginButtonClicked(_ sender: Any) {
        let error = checkAllFieldVlidation()
        if error == "" {
            presenter.login(email: emailInputText.text!, password: passwordInputText.text!)
        }else {
            let errorXIB = Error_VC_xib()
            errorXIB.modalPresentationStyle = .custom
            present(errorXIB, animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name("Error"), object: error)
        }
    }
    
    //--- Login auth protocol Confirmation -----------------------
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
    
    //--- Validation full check -----------------------
    func checkAllFieldVlidation() -> String{
        let fields: [CustomizedTextField] = [emailInputText, passwordInputText]
        var errorFields: [CustomizedTextField] = []
        var error = ""
        
        for field in fields {
           if field.getError() != "" {
            errorFields.append(field)
           }
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

