//
//  AuthResponse.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/24/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//


import UIKit

struct SignupResponse :Decodable, UserStatus {
    var status,message,code,error: MyValue?
    var response: Response?
    var errors: SignupResponseErrors?
}

struct SignupResponseErrors :Decodable {
    var email :[MyValue]?
}
