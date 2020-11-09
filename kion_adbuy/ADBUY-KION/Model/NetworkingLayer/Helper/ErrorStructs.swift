//
//  Structs.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/4/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation

//--- Error Type -----------------------------
struct NetworkError {
    static var networkError: String = "Network Error"
    static var auth: String = "Auth Error"
    static var badRequest: String = "Bad Request Error"
    static var outDated: String = "Out Dated Error"
}


//--- Errors--------
struct GlobalError: Error{
    
    var domain:String!
    var code:Int!
    var userInfo :[String:Any]?
    
    static func createInstance(domain:String? = nil,code: Int, userInfo:String?) -> GlobalError {
        guard let text = userInfo else {
            return GlobalError()
        }
        let error = GlobalError(domain: domain ?? "",
                                code: code,
                                userInfo: [NSLocalizedDescriptionKey:text])
        return error
    }
}
