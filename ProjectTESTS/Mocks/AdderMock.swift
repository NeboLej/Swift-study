//
//  AdderMock.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import Foundation

class AdderMock: AdderProtocol {
    
    private var a: Int!
    private var b: Int!
    private var result: Int!
    
    func setUp(a: Int, b: Int, result: Int) {
        self.a = a
        self.b = b
        self.result = result
    }
    
    func add(a: Int, b: Int) -> Int {
        if a == self.a && b == self.b {
            return result
        } else {
            return result - 1
        }
    }
    
    
    
    
}
