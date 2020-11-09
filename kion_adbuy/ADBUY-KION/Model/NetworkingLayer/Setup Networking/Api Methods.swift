//
//  Api Methods.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/10/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation
import Alamofire

extension SetupNetworking {
    var method: HTTPMethod {
        switch self {
        case .signUp:
            return .post
        case .signIn:
            return .post
        case .update:
            return .put
        case .token:
            return .get
        case .resetWithEmail:
            return .post
        }
    }
}
