//
//  UserDefaultsManager.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 23.11.2021.
//

import Foundation

class UserDefaultsManager {
    
    
    static var userModel: UserModelDF! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: "User") as? Foundation.Data else {
                print("tet1")
                return nil
            }
            let decodedModel = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UserModelDF.self, from: savedData)
            print("возвращаю объект \(decodedModel)")
            return decodedModel
        }
        set {
            let deafults = UserDefaults.standard
            if let userModel = newValue {
                print("начал сохранять")
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    deafults.set(savedData, forKey: "User")
                    print("сохранил объект")
                }
            }
            
        }
    }
    
    
    
    
//    public var nameUser: String! {
//        get {
//            getUser()
//        }
//        set {
//            saveUserName(name: newValue)
//        }
//    }
//    
//    init(nameUser: String) {
//        self.nameUser = nameUser
//    }
//    
//    private func saveUserName(name: String) {
//        let defaults = UserDefaults.standard
//        defaults.set(name, forKey: "nameKey")
//        print("Save????")
//        
//    }
//    
//    private func getUser() -> String {
//        print("Load??? \(UserDefaults.standard.string(forKey: "nameKey") ?? "---")//" )
//        return UserDefaults.standard.string(forKey: "nameKey") ?? "---"
//    }
    
}
