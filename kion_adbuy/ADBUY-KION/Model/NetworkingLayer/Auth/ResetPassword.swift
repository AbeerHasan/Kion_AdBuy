//
//  ResetPassword.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/18/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit

extension Auth {
    func resetPasswordWithEmail(email: String,Completion: @escaping (Result<resetPassword, GlobalError>) -> ()) {
        self.Router(target: .resetWithEmail(email: email), decoded: resetPassword.self) { (result) in
            switch result {
                case .success(let data):
                switch data.status?.Value as! Int {
                    case 200: Completion(.success(data))
                    
                    case 422: Completion(.failure(GlobalError.createInstance(code: 1, userInfo: data.errors?.Value as? String ?? "" )))
                    
                default:
                    return
                }
                case .failure(let error):
                    Completion(.failure(error))
                }
        }
    }
}
