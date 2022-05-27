//
//  String.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 27/05/22.
//

import Foundation

extension String {
   
    func validateEmail() -> Bool {
        let regex: String
        regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    func validatePassword() -> Bool {
        if self.count < 8 {
            return false
        }
        return true
    }
}
