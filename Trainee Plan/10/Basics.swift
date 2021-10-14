//
//  Basics.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class Basics {
    
    func dataTypes() {
        
        let int: Int = 9223372036854775807
        let int8: Int8 = 127
        let int16: Int16 = 32767
        let int32: Int32 = 2147483647
        let int64: Int64 = 9223372036854775807
        let intMax = Int.max
        
        
        // UInt - только положительные
        let uint: UInt = 18446744073709551615
        let uint8: UInt8 = 255
        let uint16: UInt16 = 65535
        let uint32: UInt32 = 4294967295
        let uint64: UInt64 = 18446744073709551615
        
        
        // С плавающей точкой float и double
        let float: Float = 10.10 // 32 битное число до 6 знаков после точки
        let double: Double = 100.0001 //64 битное число до 15 знаокв после точки
        
        
        //приведение числовых данных
        let numberInt = 10
        let numberDouble = 15.5
        
        let resD = Double(numberInt)*numberDouble // 155
        let resI = numberInt*Int(numberDouble) //150
        
        
        //строковые типы
        let text: String = "Oleg" //сколько угодно символов
        let ch: Character = "t" //один сивол
        
        //логический тип данных
        let bool: Bool = true
        
    }
    
    func containerDataTypes() {
        
        //кортеж (Tuple)
        //могут хранить разные типы данных
        //используются редко, так как лучше использовать коллекуии или классы
        let tuple = (100, "text", true)
        let tuple2: (Int, String, Bool) = tuple
        print(tuple2.1) //text
        
        
        //Диапазон
        //используется когда нужно указать на множество последовательных значений
        let myRange = 1...100
        
        
        //Массивы
        //Используются для хранения множества однотипных значений
        let array = [1, 2, 3, 4]
        
        //множества
        //неупорядоченный набор разных значений одного типа
        let set: Set = [1, 2, 3, 4]
        
        //словари
        //неупорядоченная послкжовательность
        //однотипных значений с кастомными индексами
        let dictionary: Dictionary = ["key1":"vslue1", "key2":"value2"]
        var emptyDict: [String:Int] = [:]
           
    }
    
    
    
}

