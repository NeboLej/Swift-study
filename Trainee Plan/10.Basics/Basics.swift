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
    
    func controlOperators() {
        
        // выделяют слудующие конструкторы языка, позволяющие управлять ходом выполнения программы
        // Утверждеине (глобальная функция assert(_:_:))
        // Оператор усовия if
        // Оператор ветвления swith
        // Операторы повторения while и repeat while
        // Оператор повторения for
        // Оператор раннего выхода guard
        
        // УТВЕРЖДЕНИЕ
        // сравнивает 2 значение и в случае false роняет программу
        let age = 100
        assert(age > 100, "программа упала")
        
        
        //ОПЕРАТОР УСЛОВИЯ
        //Обыяный синтаксис
        if 100>200 {
            print("1")
        } else if 100>150 {
            print("2")
        } else {
            print("3")
        }
        
        //тернарный оператор условия
        // проверяемое_выражение ? выражение_1 : выражение_2
        let a = 1
        let b = 2
        a < b ? print("A меньше B") : print("A Больше B")
        
        //ОПЕРАТОР ВЕТВЛЕНИЯ
        let userMark = 4
        
        switch userMark {
            case 1,2:
                print("case1")
            case 3:
                print("case2")
            case 4,5:
                print("case4")
            default:
                print("not case")
        }
        
        //ОПЕРАТОРЫ ПОВТОРЕНИЯ WHILE
        var i = 1
        while i < 10 {
            i += 1
        }
        
        i = 0
        repeat {
            i += 1
        } while i < 10
        
        //ОПЕРАТОР ПОВТОРЕНИЯ FOR
        for element in [1, 2, 3, 4, 5] {
            print(element)
        }
        
        var result = 0
        for i in 1...10 where i % 2 == 0 {
            result += 1
        }
        
        [1, 2, 3, 4, 5].forEach { print($0) }
        
        //ОПЕРАТОР ДОСРОЯНОГО ВЫХОДА
        //выполняет тело только если условие возвражает false
        guard 1>0 else {
            //тело
        }
    }
    
    func optionalType() {
        
        //переменные опционального типа
        var boolOptional: Bool? //nil
        
        //способы извлечения опционального значения
        //принудительное извлечение force unwrapping
        //косвенное извлечение implicitly unwrapping
        //
        
        //ПРИНУДИТЕЛЬНО ИЗВЛЕЧЕНИЕ force unwrapping
        var optInt: Int? = 12
        var int: Int = 34
        let result = optInt! + int
        
        
        //КОСВЕННОЕ ИЗВЛЕЧЕНИЕ implicitly unwrapping
        var optDouble: Double! = 3.14
        
        
        //ОПЦИОНАЛЬНОЕ СВЯЗЫВАНИЕ
        
        let optionalName: String? = "Bob"
        
        print(optionalName) //это опасно
        
        if let username = optionalName { //это не опасно
            print(username)
        }
            
        
    }
    
    
    
}


