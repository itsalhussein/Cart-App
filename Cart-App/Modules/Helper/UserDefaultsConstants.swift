//
//  UserDefaultsConstants.swift
//  Cart-App
//
//  Created by Hussein Anwar on 21/11/2022.
//

import Foundation

struct UserDefaultsConstants {
    static var initialDate: Date {
        set {
            UserDefaults().set(newValue, forKey: "INITIALDATE")
        }
        get {
            return UserDefaults().object(forKey: "INITIALDATE") as? Date ?? Date()
        }
    }
    
}
