//
//  Api(Base&Path).swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/10/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

extension SetupNetworking {
    
    var baseURL: String {
        switch self {
        default: return Api.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .signUp:
            return Api.signUp
        case .signIn:
            return Api.signIn
        case .update:
            return Api.update
        case .token:
            return Api.token
        case .resetWithEmail:
            return Api.resetWithEmail
        }
    }
}
