//
//  RoundedButton.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedView: UIView {
    
    //---Attributes Appearse on the proprities-----
    @IBInspectable
    var cornerRadius : CGFloat = 20.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable
    var shadowOpacity : CGFloat = 1 {
        didSet {
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    //---------------------------------------------
    
    override func awakeFromNib() { // to make the design appears at run time
        super.awakeFromNib()
        self.setUpView()
    }
    override func prepareForInterfaceBuilder() { // to make the design appears on the storyboard
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    //----------------------------------------------
    func setUpView(){
        let sceenWidth = UIScreen.main.bounds.width
        if sceenWidth >= 568 {
            self.layer.cornerRadius = cornerRadius * 2.5
        }else {
            self.layer.cornerRadius = cornerRadius
        }
        self.layer.shadowColor = Orange.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 1.7
    }
    
    
}

