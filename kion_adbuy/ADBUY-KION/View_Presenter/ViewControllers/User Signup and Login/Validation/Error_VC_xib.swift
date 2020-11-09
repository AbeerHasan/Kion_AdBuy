//
//  Error_VC_xib.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/11/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class Error_VC_xib: UIViewController {


    @IBOutlet weak var errorMessageLabel: CustomLabelFontSize!
   
    //----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: NSNotification.Name("Error"), object: nil)
        
        //close the xib after screen tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                 view.addGestureRecognizer(tap)
    }
    //-----------------------------------------------
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
               
    }
    //-----------------------------------------------
    @objc func didGetNotification(_ notification: Notification){
        let errorMessage = notification.object as! String
        errorMessageLabel.text = "\(errorMessage)!"
    }
        
    @objc func handleTap(){
        self.dismiss(animated: true, completion: nil)
    }
}
