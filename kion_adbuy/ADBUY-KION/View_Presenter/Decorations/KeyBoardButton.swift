//
//  KeyBoardButton.swift
//  ADBUY-KION
//
//  Created by Mohamed Tarek on 9/7/20.
//  Copyright © 2020 alaa salama. All rights reserved.
//

import UIKit
import IQKeyboardManager

extension UIViewController: UITextFieldDelegate {
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        
        textField.inputAccessoryView = toolBar
    }

    @objc func donePressed() {
        view.endEditing(true) // or do something
    }

    @objc func cancelPressed() {
        view.endEditing(true) // or do something
    }
}
