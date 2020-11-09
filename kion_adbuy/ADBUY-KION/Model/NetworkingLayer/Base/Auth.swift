//
//  UsersAPI.swift
//  ADBuy
//
//  Created by Mohamed Tarek on 8/21/20.
//  Copyright © 2020 MohamedTarek. All rights reserved.
//

import UIKit


class Auth: BaseApi< SetupNetworking > {
    
    static var shared = Auth()
    
    /// Authenication Func for receive a status from api and get completion with the meaning of status code
    
    func Authenticate <M:UserStatus>(result: Result<M, GlobalError>, completion: @escaping (Result<UserStatus,GlobalError>) -> ()) {
        
       switch result {
       case .success(let data):
        
        guard let stausNumber = data.status?.Value as? Int else {
            completion(.failure(GlobalError.createInstance(code: 1002, userInfo: "it's not int")))
            return}
        
            let vaildUser = self.authStatus(statusInt: stausNumber)
               switch vaildUser {
               case .success:
                    completion(.success(data))
               case .failure(let error):
                    completion(.failure(GlobalError.createInstance(code: stausNumber ,userInfo: error)))
               }
        
       case .failure(let error):
           completion(.failure(error))
       }
    }
    ///authStatus func for switch in status code and get completion result
    func authStatus(statusInt: Int) -> StatusResult<String> {
         switch statusInt {
             case 200...299 : return .success
             case 400 : return .failure("Bad Request")
             case 401 : return .failure("Wrong email or password")
             case 403 : return .failure("Forbidden")
             case 404 : return .failure("Resource Not Found")
             case 422 : return .failure("This email has already been taken")
             case 500 : return .failure("Internal Server error")
             default: return .failure("Network Error")
         }
     }   
}
