//
//  UserDefaultsManager.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 23.11.2021.
//

import Foundation

class UserDefaultsManager {
    
    let defaultUser = UserDefaults.standard
    
    private var user: UserModelDF {
        get {
            if let data = defaultUser.value(forKey: "user") as? Foundation.Data {
                return try! PropertyListDecoder().decode(UserModelDF.self, from: data)
            } else {
                return UserModelDF(name: "", age: "", sex: "")
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaultUser.set(data, forKey: "user")
            }
        }
    }
    
    func saveUser(name: String, age: String, sex: String) {
        let user = UserModelDF(name: name, age: age, sex: sex)
        self.user = user
        
    }
    
    func getUser() -> UserModelDF {
        self.user
    }
    
}
