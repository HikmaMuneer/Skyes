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
    
    func stringDateToDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        return dataFormat.date(from: self)
    }
    
    func stringDateChangeFormat(format: String, newFormat: String ) -> String {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        if let dt = dataFormat.date(from: self) {
            dataFormat.dateFormat = newFormat
            return dataFormat.string(from: dt)
        }else{
            return ""
        }
    }
    
}
extension Date {
    func displayDate(format: String, addMinTime:  Int = 0) -> String {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        let date = self.addingTimeInterval(TimeInterval(60 * addMinTime))
        return dataFormat.string(from: date)
    }
}
