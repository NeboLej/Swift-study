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

struct UserModelDF: Codable {
    
    var name: String
    var age: String
    var sex: String
  
}
