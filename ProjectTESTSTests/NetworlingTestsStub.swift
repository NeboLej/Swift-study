//
//  NetworlingTestsStub.swift
//  ProjectTESTSTests
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import XCTest
@testable import ProjectTESTS
    


class NetworlingTestsStub: XCTestCase {
    
    var network: Networking!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        network = Networking()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        network = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworking() {

        
        //given
        let stubbedData = "[text]".data(using: .utf8)
        let urlString = "https://jsonplaceholder.typicode.com/posts/1"
        let url = URL(string: urlString)!
        let stubbedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        let urlSessionStub = URLSessionStub(data: stubbedData, response: stubbedResponse, error: nil)
        network.urlSession = urlSessionStub
        let expectation = expectation(description: "Completion handler invoked")
        
        //when
        network.getReqest { data in
            print(data)
            expectation.fulfill()
            //XCTAssertEqual(data, "text")
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
