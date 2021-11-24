//
//  ProjectTESTSUITests.swift
//  ProjectTESTSUITests
//
//  Created by Anton Pakhomov on 17.11.2021.
//

import XCTest
@testable import ProjectTESTS

class ProjectTESTSUITests: XCTestCase {

    //var testObject: UnderTests!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        //testObject = UnderTests()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
       // testObject = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
 
        
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    func testTapButtonIsEnabled() throws {
        //given
        let app = XCUIApplication()
        let result: Bool?
        let expected = false
        
        //when
        app.launch()
        app.textFields["TextField1"].tap()
        app.textFields["TextField1"].typeText("wtf")
        app.buttons["Button1"].tap()
        
        result = app.buttons["Button1"].isEnabled
        
        //then
        //XCTAssertEqual(expected, result)
        
        XCTAssertEqual(expected, result)
     
    }

    func testTapButtonHello() throws {
        //given
        let app = XCUIApplication()
        let expected = "Hello!"

        //when
        app.launch()
        app.textFields["TextField1"].tap()
        app.textFields["TextField1"].typeText("help me please")
        app.buttons["Button1"].tap()
        
        
        let result = app.textFields["TextField1"].value as! String
               
        //then
     
        XCTAssertEqual(expected, result)
        
        //смотрит у детей
        //XCTAssert(app.textFields["TextField1"].children(matching: .staticText)[expected].exists)
        
        
        //смотрит по всей иерархии
        //XCTAssert(app.textFields["TextField1"].descendants(matching: .staticText)[expected].waitForExistence(timeout: 1.0))

    }
    
}
