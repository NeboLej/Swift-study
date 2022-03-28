import Foundation

class FunctionalProgramming {
    
    
    func map_() {
        let array1 = [0, 1, 2, 3, 4, 5]
        let array1Map = array1.map {$0 * 10}
        print(array1Map)
        //  [0, 10, 20, 30, 40, 50]
        let array2 = ["2", "gg", "0", "123"]
        let array2map = array2.map { str in Int(str) }
        print(array2map)
        //  [Optional(2), nil, Optional(0), Optional(123)]
    }
    
    func compactMap_() {
        let array2 = ["2", "gg", "0", "123", "2k14"]
        let array2compactMap = array2.compactMap {Int($0)}
//        let array2compactMap = array2.compactMap(Int.init)
        print(array2compactMap)
        //  [2, 0, 123]
    }
    
    func filter_() {
        let array1 = [1, 2, 3, 4, 5, 6, 7]
        let array1Filter = array1.filter { $0 % 2 == 0 }
        print(array1Filter)
        // [2, 4, 6]
        
        
        let images = [6, 22, 8, 14, 16, 0, 7, 9]
        let removedIndexes = [2,5,0,6]
        let images1 = images
            .enumerated()
            .filter { !removedIndexes.contains($0.offset) }
            .map { $0.element }
        print (images1)
        // [22, 14, 16, 9]
    }
    
    
    func reduce_() {
        let array1 = [1, 2, 3, 4, 5, 6, 7]
        let sum = array1.reduce(0, +)
        print(sum)
        // 28
        
        // Remove duplicates
        let arrayInt = [1,1,2,6,6,7,2,9,7]
        
        let arrayIntReduce = arrayInt.reduce(into: []) {
            !$0.contains($1) ? $0.append($1) : () }
        print(arrayIntReduce)
        // [1, 2, 6, 7, 9]
    }
    
    
    func flatMap_() {
        let multilineString = """
        Есть свойства, бестелесные явленья,
        С двойною жизнью; тип их с давних лет, —
        Та двойственность, что поражает зренье:
        То — тень и сущность, вещество и свет.
        """

        let words = multilineString.lowercased()
                   .split(separator: "\n")
                   .flatMap{$0.split(separator: " ")}
        print(words)
        //["есть", "свойства,", "бестелесные", "явленья,", "с", "двойною", "жизнью;", "тип", "их", "с", "давних", "лет,", "—", "та", "двойственность,", "что", "поражает", "зренье:", "то", "—", "тень", "и", "сущность,", "вещество", "и", "свет."]
    }
    
    
    
}
