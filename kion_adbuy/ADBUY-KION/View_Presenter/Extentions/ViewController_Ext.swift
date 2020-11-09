//
//  ViewController_Ext.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/23/20.
//  Copyright © 2020 KION. All rights reserved.
//

import UIKit


class UserAuth_VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(stopEdition))
        self.view.addGestureRecognizer(tab)
    }
    //--------------------------------------------------------
    @objc func stopEdition(){
           self.view.endEditing(true)
       }
    
    func startSpinning(spenner: UIActivityIndicatorView){
        spenner.isHidden = false
        spenner.startAnimating()
    }
       
    func stopSpinning(spenner: UIActivityIndicatorView){
        spenner.isHidden = true
        spenner.stopAnimating()
    }
       
    func goHome() {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePage") as! Home_VC
        self.present(viewController, animated: false, completion: nil)
    }
       
    func showAllertMessage(allertTitle: String, error: String, actionTitle: String ) {
        let APIErrorPopUp = UIAlertController(title: allertTitle, message: "\(error)!", preferredStyle: .alert)
        let cancelButtonClicked = UIAlertAction(title: actionTitle, style: .destructive) { (buttonTapped) in
            do {
                APIErrorPopUp.dismiss(animated: true, completion: nil)
            }
        }
        APIErrorPopUp.addAction(cancelButtonClicked)
        present(APIErrorPopUp, animated: true, completion: nil)
    }
}
