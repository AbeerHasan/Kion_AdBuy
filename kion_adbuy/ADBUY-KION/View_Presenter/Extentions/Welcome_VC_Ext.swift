//
//  Welcome_VC_Ext.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

//----- Collection view setup--------------------------------------------------

extension Welcome_VC:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return welcomeSlide_Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WelcomSlideCell", for: indexPath) as! WelcomeSlide_CV_Cell
        cell.setImage(image: welcomeSlide_Images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
        let widthVal = collectionView.frame.width
        let heightVal = collectionView.frame.height
         
         return CGSize(width: widthVal  , height: heightVal )
     }
}
