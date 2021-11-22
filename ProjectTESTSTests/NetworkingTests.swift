//
//  NetworkingTests.swift
//  ProjectTESTSTests
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import XCTest
@testable import ProjectTESTS

class NetworkingTests: XCTestCase {
    var networkManager: Networking!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        networkManager = Networking()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        networkManager = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetwork() {
        //given
        let expected = DataModel(userId: 1, dataId: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        var result: DataModel!
        let expectation = expectation(description: "complit reqest")
        //when
        networkManager.getReqest { data in
            result = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2.0) { error in
            if error != nil {
                XCTFail()
            }
        }
        //then
            XCTAssertEqual(expected, result)
    }
    
}

