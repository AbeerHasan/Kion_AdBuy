//
//  AuthResponse.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/24/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import UIKit

struct SigninResponse: Decodable,UserStatus {
    var status: MyValue?
    var message, errors, error: MyValue?
    var response:Response?
}
