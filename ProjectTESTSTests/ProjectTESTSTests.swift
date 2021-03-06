//
//  ProjectTESTSTests.swift
//  ProjectTESTSTests
//
//  Created by Anton Pakhomov on 17.11.2021.
//

import XCTest
@testable import ProjectTESTS

class ProjectTESTSTests: XCTestCase {

    var objectToTest: UnderTests!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        objectToTest = UnderTests()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        objectToTest = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMyltiply() {
        
        //given
        let a = 10
        let b = 2
        let expected = 20
        
        //when
        let result = objectToTest.myltiply(a: a, b: b)
        
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testHalfWeekMonday() {
        //given
        let number = 1
        let expected = "понедельник"
        //when
        let result = objectToTest.halfWeek(number: number)
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testHalfWeekWednesday() {
        //given
        let number = 3
        let expected = "среда"
        //when
        let result = objectToTest.halfWeek(number: number)
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testHalfWeekError() {
        //given
        let number = 100
        let expected = "Ошибка!"
        //when
        let result = objectToTest.halfWeek(number: number)
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testAsyncValidateLoginTextFields() {
        //given
        let loginTF = UITextField()
        let passwordTF = UITextField()
        let expected = false
        var result: Bool?
        //для тестирования асинхронных методов используется expectation в конструкторе передаем то, как мы обозначаем тестируемый метод
        let validExpectation = expectation(description: "Expectation in " + #function)
        
        //when
        objectToTest.asyncValidateLoginTextFields(loginTF: loginTF, passwordTF: passwordTF) { isValid in
            
            result = isValid
            
            validExpectation.fulfill()  // встреча произошла
        }
        
        //then
        //проверяет завершились ли все expectation
        waitForExpectations(timeout: 2.0) { error in
            //если не все expectation отработали, то error cстанет != nil и тест упадет 
            if error != nil {
                XCTFail()
            }
            XCTAssertEqual(expected, result)
        }
    }
}
