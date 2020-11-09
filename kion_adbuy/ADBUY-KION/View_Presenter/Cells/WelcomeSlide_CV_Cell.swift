//
//  WelcomeSlide_CV_Cell.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class WelcomeSlide_CV_Cell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func setImage(image: UIImage){
           backgroundImage.image = image
    }
    
}
