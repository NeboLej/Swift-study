//
//  UserModel.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 23.11.2021.
//

import Foundation

enum SexType: String {
    case male
    case female
}

class UserModelDF: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(password, forKey: "password")
        coder.encode(sex.rawValue, forKey: "sex")
        
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        password = coder.decodeObject(forKey: "password") as? String ?? ""
        sex = SexType(rawValue: coder.decodeObject(forKey: "sex") as! String) ?? SexType.male
    }
    
    var name: String
    var password: String
    var sex: SexType
    
    init(name: String, password: String, sex: SexType) {
        self.name = name
        self.password = password
        self.sex = sex
    }
    
    
}
