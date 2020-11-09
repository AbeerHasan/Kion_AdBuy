//
//  Validation.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/9/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

enum ValidationType: String{
    case email = "email address \n ex. someName@something.com"
    case phone = "number \n Should be 10 numbers \n ex.(011)XXXXXXXX  "
    case password = "password \n Should be at least 8 characters containing at least 1 number,an upper and lower case letter"
    case name = "name \n should contain letters only and no spaces"
    case confirmPassword
}

enum ValidationResult<errReason,type> {
    case success
    case failure(errReason: String)
}


struct ErrorContent {
    static var fieldRequired = "This field/s is required"
    static var notValid = "Not Valid"
}
struct Validation {
    
    
   //---- Check one field only ---------------------------------------------------------
    static func fieldIsFullAndValid(fieldContent: String, type: ValidationType, completion: (ValidationResult<String, ValidationType>) -> ()){
       if fieldContent.isEmpty {
           completion(.failure(errReason: ErrorContent.fieldRequired))
       }else if fieldContent.isValid(type) || ( currentForm == .Login && type == .password) || type == .confirmPassword {
           completion(.success)
       }else if !fieldContent.isValid(type) {
        completion(.failure(errReason: "\(ErrorContent.notValid) \(type.rawValue)"))
       }
    }
}


