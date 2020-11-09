//
//  SignIn.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/23/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import Foundation

extension Auth { // signin method
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<SigninResponse,GlobalError>,ValidationType?) -> ()) {
                    self.Router(target: .signIn(email: email, password: password), decoded: SigninResponse.self) { (result) in
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
                            completion(.failure(error), nil)
                        }
                    }
               }
    }
