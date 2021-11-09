
import Foundation

struct ResponseModel: Codable {
    let type: String
    let data: [CurrencyModel]
}

struct CurrencyModel: Codable {
    let symbol: String
    let price: Double
    let time: Double
    let volume: Double
    let c: String?
//     если поля названий не соответствуют json то создается енам
//     где необходимо описать ВСЕ свойства, которые мы хотим получить
    enum CodingKeys: String, CodingKey {
        case symbol = "s"
        case price = "p"
        case time = "t"
        case volume = "v"
        case c
    }
}
