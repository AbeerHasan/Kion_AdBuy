//
//  User.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 8/31/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    var id, first_name, last_name, email, mobile ,token: MyValue?
}
/*
 "first_name": "Mohamed",
 "last_name": "Nagy",
 "email": "user@test.com",
 "password": 12345678,
 "c_password": 12345678,
 "mobile": 1122334455
 */
