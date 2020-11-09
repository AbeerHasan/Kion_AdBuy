//
//  ResetWithEmailResponse.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/18/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

struct resetPassword: Decodable{
    
    var message, errors, status: MyValue?
    var response: ResponseResetPassword?

}
struct ResponseResetPassword: Decodable{
    var data: MyValue?
    var mete: MyValue?
}
