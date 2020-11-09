//
//  ResetPasswordEmail_VC.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/18/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class ResetPasswordEmail_VC: UserAuth_VC , UserAuth_view {

    //--- Outlets -------------------------------------------------
    @IBOutlet weak var emailInputTextField: CustomizedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //--- vars-----------------------------------------------------
    var presenter: UserResetPassword_P!
    
    //-------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityIndicator.isHidden = true
        
        presenter = UserResetPassword_P(userAuth_view: self)
    }
    
    //--- Actions--------------------------------------------------
    @IBAction func continueButtonClicked(_ sender: Any) {
        if emailInputTextField.getError() == "" {
            presenter.resetPasswordWithEmail(email: emailInputTextField.text!)
        }else {
            emailInputTextField.showErrorWorning()
            let errorXIB = Error_VC_xib()
            errorXIB.modalPresentationStyle = .overCurrentContext
            present(errorXIB, animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name("Error"), object: emailInputTextField.getError())
        }
    }
    //--- protocol confirmation-----------------------------------------------------------
    func showProgressBar() {
        self.startSpinning(spenner: activityIndicator)
    }
               
    func hideProgressBar() {
        self.stopSpinning(spenner: activityIndicator)
      }
     
    func showSuccess() {
        let APIErrorPopUp = UIAlertController(title: "Success", message: "Confimation message sent to your email", preferredStyle: .alert)
        let cancelButtonClicked = UIAlertAction(title: "Ok back to login", style: .destructive) { (buttonTapped) in
            do {
                let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as! LoginContainer_VC
                currentForm = .Login
                self.present(viewController, animated: false, completion: nil)
            }
        }
        APIErrorPopUp.addAction(cancelButtonClicked)
        present(APIErrorPopUp, animated: true, completion: nil)
    }
          
    func showError(error: String) {
        self.showAllertMessage(allertTitle: "Something Wrong", error: error, actionTitle: "Dismiss")
    }
    
        
   
}
    
