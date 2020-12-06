//
//  UIViewController+Keyboard.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
