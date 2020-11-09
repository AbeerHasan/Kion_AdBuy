//
//  Api headers.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/10/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation
import Alamofire

extension SetupNetworking {
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type":"application/json"]
        }
    }
}
