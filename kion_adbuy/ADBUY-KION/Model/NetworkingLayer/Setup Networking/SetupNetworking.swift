
//
//  AuthResponse.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/24/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import UIKit
import Alamofire

enum SetupNetworking: TargetType{

    case signUp(firstName: String, lastName: String, email: String, password: String, repeatPassword: String,mobile: String)
    
    case signIn(email: String, password: String)
    
    case update(firstName: String, lastName: String, email: String, token: String)
    
    case token(token: String)
    
    case resetWithEmail(email: String)
    
}
