//
//  Utilities.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/5/20.
//  Copyright © 2020 Lopez Bryan. All rights reserved.
//

import Foundation

class Utilities {
    
    // check regular expression of password
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
