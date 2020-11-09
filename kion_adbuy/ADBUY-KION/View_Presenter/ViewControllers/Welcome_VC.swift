//
//  Welcome_VC.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

class Welcome_VC: UIViewController {

    //---Outlets-------------------------------
    @IBOutlet weak var welcomeSlid_CollectionView: UICollectionView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var pageControler: UIPageControl!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var continuebutton: CustomizedButton!
    
    //---Variabls------------------------------
    var currentImageIndex = 0
    
    //-----------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //---Welcome content-------------------
        startSlideShow()
    }
    
    //----Actions------------------------------
    @IBAction func continueButtonClicked(_ sender: Any) {
        if currentImageIndex < 2 {
            changeImage( nextImageIndex: currentImageIndex + 1 )
        }else {
            performSegue(withIdentifier: "GoToHomeScreen", sender: nil)
        }
    }
    
    //----------------------------------------------------
    func startSlideShow(){
        welcomeSlid_CollectionView.delegate = self
        welcomeSlid_CollectionView.dataSource = self
        
        pageControler.numberOfPages = welcomeSlide_Images.count
        pageControler.currentPage = 0
    }
    
    
    func changeImage(nextImageIndex: Int){
        let index = IndexPath(item: nextImageIndex , section: 0)
        welcomeSlid_CollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        tipLabel.text = welcomeSlide_Tips[nextImageIndex]
        pageControler.currentPage = nextImageIndex
       
        currentImageIndex = nextImageIndex
    }
    
    
}
