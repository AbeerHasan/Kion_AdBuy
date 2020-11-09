//
//  CustomFontSize.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/3/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class CustomLabelFontSize: UILabel {
    
    
    //--- Resize font----------------------------
    @IBInspectable
    var fontSize : CGFloat = 24 {
        didSet{
            self.font = UIFont(name: self.font.fontName, size: autoFontSize(interedFontSize: fontSize))
        }
    }
    //--------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //--------------------------------------------
    func autoFontSize(interedFontSize: CGFloat) -> CGFloat {
         let sceenWidth = UIScreen.main.bounds.width
         if sceenWidth >= 568 {
             
             return interedFontSize * 2
         }
         return interedFontSize
     }
     
    
}

