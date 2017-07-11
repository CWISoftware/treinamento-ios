//
//  UserDefaultsManager.swift
//  DadosDemo
//
//  Created by Juliano Krieger Nardon on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    static let userNameKey = "userNameKey"
    
    static var userName : String? {
        get {
            return UserDefaults.standard.string(forKey: self.userNameKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.userNameKey)
        }
    }
}
