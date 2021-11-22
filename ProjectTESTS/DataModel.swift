//
//  DataModel.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import Foundation

struct DataModel: Codable, Equatable {
    let userId: Int
    let dataId: Int
    let title: String
    let body: String

    
    // если поля названий не соответствуют json то создается енам
    // где необходимо описать ВСЕ свойства, которые мы хотим получить
    
    enum CodingKeys: String, CodingKey {
        case userId
        case dataId = "id" //по какому ключу парсим
        case title
        case body
    }
    
}
