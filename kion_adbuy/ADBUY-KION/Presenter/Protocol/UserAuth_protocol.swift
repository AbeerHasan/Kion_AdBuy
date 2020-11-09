//
//  UserAuth_protocol.swift
//  ADBUY-KION
//
//  Created by Mohammed Mohsin Sayed on 9/22/20.
//  Copyright © 2020 KION. All rights reserved.
//

import Foundation

protocol UserAuth_view: class {
    func showSuccess()
    func showError(error: String)
    func showProgressBar()
    func hideProgressBar()
}
