//
//  AuthResponse.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/24/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import UIKit

protocol UserStatus {
    var status: MyValue? {get}
}

struct Response: Decodable {
    var data: UserData?
    var meta: MyValue?
}


