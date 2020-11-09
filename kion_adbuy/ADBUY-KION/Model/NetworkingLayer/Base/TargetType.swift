//
//  TargetType.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/4/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit
import Alamofire

public typealias Parameters = [String:Any]

enum Task {
    case request
    case reauthenticate(header: HTTPHeaders)
    case requestWithParameter(para: Parameters, enocding: ParameterEncoding)
    case requestWithParameterAndHeaders(para: Parameters, enocding: ParameterEncoding,headers: HTTPHeaders)
}


protocol TargetType {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var task: Task {get}
    var headers: HTTPHeaders? {get}
}

enum StatusResult<reason> {
    case success
    case failure(reason)
}

