//
//  UIKitExtension.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-18.
//

import Foundation

extension String{
    
    var isValidEmail: Bool {
        let emailRegEx = "[a-zA-Z0-9][a-zA-Z0-9_.]+@[a-zA-Z0-9_]+\\.[a-zA-Z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)

    }
    
}
