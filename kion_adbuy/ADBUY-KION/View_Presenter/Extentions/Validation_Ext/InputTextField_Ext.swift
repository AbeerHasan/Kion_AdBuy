//
//  InputTextField_Ext.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/14/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

extension CustomizedTextField {
    
     
    func setError(error: String){
        self.lastError = error
    }
    func getError() -> String {
        return self.lastError
    }
      
    @objc func checkFieldVlidation() {
        //--- text begining don't accept space---------------
        if self.text == " " {
            self.text = ""
        }
        
        let validationType = getValidationType()
        
        Validation.fieldIsFullAndValid(fieldContent: self.text!, type: validationType) { (result) in
          switch result {
            case .failure(errReason: let error):
                showErrorWorning()
                self.setError(error: error)
            case .success :
                hideErrorWorning()
                self.setError(error: "")
              
            }
        }
    }
    
    //--- Helper Functions ----------------------------------------------
    func getValidationType() -> ValidationType{
        var validationType: ValidationType
            
        if self.placeholder == "Email" {
            validationType = .email
        }else if self.placeholder == "Password" {
            validationType = .password
        }else if self.placeholder == "Phone number" {
            validationType = .phone
        }else if self.placeholder == "First name" || self.placeholder == "Last name" {
            validationType = .name
        } else {
            validationType = .confirmPassword
        }
        
        return validationType
    }
    
    func showErrorWorning(){
        self.rightView = self.showErrorButton
        self.rightViewMode = .always
       
    }
    
    func hideErrorWorning(){
        self.rightViewMode = .never
       
        
    }
    
    @objc func showError(){
        let errorXIB = Error_VC_xib()
        errorXIB.modalPresentationStyle = .custom
        parentContainerViewController?.present(errorXIB, animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name("Error"), object: self.getError())
    }
   
    func clearText(){
        self.text = ""
    }
}
