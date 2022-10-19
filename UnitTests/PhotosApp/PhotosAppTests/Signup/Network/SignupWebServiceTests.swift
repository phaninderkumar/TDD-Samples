//
//  SignupWebServiceTests.swift
//  PhotosAppTests
//
//  Created by Phaninder on 18/10/22.
//

import XCTest
@testable import PhotosApp

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signupFormRequestModel = SignupFormRequestModel(firstName: "Phaninder", lastName: "Kumar", email: "phaninder.205@gmail.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.stubError = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok", "Expected ok but received something else")
            expectation.fulfill()
        }
        
        // to wait for response we need to write this expectation after the function call
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ReturnError() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "Expected nil response model but received a parsed model")
            XCTAssertEqual(error, SignupError.responseModelParsing, "Expected responseModelParsingError error but received other error")
            expectation.fulfill()
        }
        
        // to wait for response we need to write this expectation after the function call
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            
            // Assert
            XCTAssertNil(signupResponseModel, "Expected signupResponseModel to be nil")
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "Expected invalidRequestURLStringError error")
            expectation.fulfill()
        }
        
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        
        MockURLProtocol.stubError = SignupError.failedRequest(description: errorDescription)
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "The signup method did return an expected error for Failed request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
}
