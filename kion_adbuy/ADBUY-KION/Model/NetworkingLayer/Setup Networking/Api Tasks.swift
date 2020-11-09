//
//  Api Tasks.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/10/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import Foundation
import Alamofire

extension SetupNetworking {
    var task: Task {
        switch self {
        case .signUp(firstName: let firstName, lastName: let lastName, email: let email, password: let password, repeatPassword: let repeatPassword, mobile: let mobile):

            let parameter = ["first_name": firstName,
                             "last_name": lastName,
                             "email": email,
                             "password": password,
                             "c_password": repeatPassword ,
                             "mobile": mobile
            ]

            return .requestWithParameter(para: parameter, enocding: JSONEncoding.default)

        case .signIn(email: let email, password: let password):
            let parameter = ["email": email,
                             "password": password,]

            return .requestWithParameter(para: parameter, enocding: JSONEncoding.default)


        case .update(firstName: let firstName, lastName: let lastName, email: let email, token: let token):
            let parameter = ["first_name": firstName,
                             "last_name": lastName,
                             "email": email]

            let header = ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
            let headers = HTTPHeaders(header)

            return .requestWithParameterAndHeaders(para: parameter, enocding: JSONEncoding.default, headers: headers)

        case .token(token: let token):
            let header = ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
            let headers = HTTPHeaders(header)

            return .reauthenticate(header: headers)
            
        case .resetWithEmail(let email):
             let parameter = ["email": email]
             return .requestWithParameter(para: parameter, enocding: JSONEncoding.default)
        }
    }
}
