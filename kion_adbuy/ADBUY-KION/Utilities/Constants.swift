//
//  Constants.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/4/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

//--- Welcome Slide --------------------------------
let welcomeSlide_Tips = ["The best online store for your shopping", "watch product videos and take points", "Start your journey and shop now"]

let welcomeSlide_Images = [#imageLiteral(resourceName: "storyboarding"),#imageLiteral(resourceName: "welcome – 4"),#imageLiteral(resourceName: "storyboarding2")]


//--- Networking Layer Links -----------------------

struct Api {
    
    static var baseURL: String = "https://be.shareand.shop/api/"
    static var signUp: String = "user/register"
    static var signIn: String = "user/login"
    static var update: String = "user/profile"
    static var token: String = "user/profile"
    // reset pass
    static var resetWithEmail = "password/email"
    static var resetPassword = "password/reset"
}
