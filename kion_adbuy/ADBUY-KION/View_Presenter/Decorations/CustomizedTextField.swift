//
//  InputTextField.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//



import UIKit

class CustomizedTextField: UITextField {
    //--- Resize font----------------------------
       @IBInspectable
       var fontSize : CGFloat = 19 {
           didSet{
               self.font = UIFont(name: self.font!.fontName, size: autoFontSize(interedFontSize: fontSize))
           }
       }
    
    //--- Variables -------------------------------------------------
    var lastError = ErrorContent.fieldRequired
    var showErrorButton = UIButton()
    
    //----------------------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        //--- Decoration ---------------------
        placeholderDesign(color: Light_Text)
        self.showErrorButton = .init(type: .detailDisclosure)
        self.showErrorButton.alpha = 0.6
        
        //--- targets ------------------------
        self.showErrorButton.addTarget(self, action: #selector(showError), for: .touchUpInside)
        self.addTarget(self, action: #selector(checkFieldVlidation), for: .editingChanged)
    }
    
    //--- helper functions -------------------------------------------
    func autoFontSize(interedFontSize: CGFloat) -> CGFloat {
        let sceenWidth = UIScreen.main.bounds.width
        if sceenWidth >= 568 {
            return interedFontSize * 2
        }
        return interedFontSize
    }
     
    func placeholderDesign(color: UIColor){
        let placeHolder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.attributedPlaceholder = placeHolder
    }
    
}
