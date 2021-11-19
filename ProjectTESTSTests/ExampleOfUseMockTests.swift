//
//  ExampleOfUseMockTests.swift
//  ProjectTESTSTests
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import XCTest
@testable import ProjectTESTS

class ExampleOfUseMockTests: XCTestCase {

    var objectTests: ExampleOfUseMock!
    var adderMock: AdderMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        adderMock = AdderMock()
        objectTests = ExampleOfUseMock(adder: adderMock)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        objectTests = nil
        adderMock = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSqSumm() {
        //given
        
        let a = 5
        let b = 10
        let expected = 100
        adderMock.setUp(a: a, b: b, result: 10)
        //when
        let result = objectTests.sqSumm(a: a, b: b)
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testSummSq() {
        //given
        let a = 5
        let b = 2
        let expected = -1
        adderMock.setUp(a: 25, b: 4, result: -1)
        //when
        let result = objectTests.summSq(a: a, b: b)
        //then
        XCTAssertEqual(expected, result)
    }
    
    
    
    

}
