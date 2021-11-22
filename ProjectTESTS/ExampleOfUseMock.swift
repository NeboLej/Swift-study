//
//  exampleOfUseMock.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import Foundation

protocol AdderProtocol {
    func add(a: Int, b: Int)-> Int
}

class Adder: AdderProtocol {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
}

class ExampleOfUseMock {
    
    
    private var adder: AdderProtocol!
    
    init(adder: AdderProtocol) {
        self.adder = adder
    }
    
    
    func sqSumm(a: Int, b: Int) -> Int {
        var result = adder.add(a: a, b: b)
        result *= result
        return result
    }
    
    func summSq(a: Int, b: Int) -> Int {
        let sqA = a*a
        let sqB = b*b
        let result = adder.add(a: sqA, b: sqB)
        return result
    }
    
}



