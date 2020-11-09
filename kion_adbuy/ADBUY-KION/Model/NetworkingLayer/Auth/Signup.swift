//
//  SignUp.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/23/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import Foundation

typealias MainCompletion = (Result<Any,GlobalError>) -> ()

extension Auth {

    func signUp(email: String,
                mobile: String,
                password: String,
                firstName: String,
                lastName: String,
                repeatPassword: String,
                completion: @escaping (Result<SignupResponse,GlobalError>,ValidationType?) -> ()) {
        
                self.Router(target: .signUp(firstName: firstName , lastName: lastName, email: email, password: password, repeatPassword: repeatPassword, mobile: mobile), decoded: SignupResponse.self) { (result) in
                    switch result {
                    case .success(let data):
                         self.Authenticate(result: result) { (result) in
                            switch result {
                                case .success(_):
                                    completion(.success(data), nil)
                                case .failure(let error):
                                    completion(.failure(error), nil)
                            }
                         }
                    case .failure(let error):
                        completion(.failure(error),nil)
                    }
                }
        }
}
