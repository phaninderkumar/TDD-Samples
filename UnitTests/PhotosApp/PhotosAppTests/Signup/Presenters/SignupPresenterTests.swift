//
//  SignupPresenterTests.swift
//  PhotosAppTests
//
//  Created by Phaninder on 19/10/22.
//

import XCTest
@testable import PhotosApp

class SignupPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        signupFormModel = SignupFormModel(firstName: "Phaninder",
                                              lastName: "Kumar",
                                              email:
                                                "phaninder.205@gmail.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()

        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, viewDelegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }
    
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Password equality was not validated")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "Signup method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessfull_ShouldCallSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        self.wait(for: [myExpectation], timeout: 5)
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "successfullSignup() method was called more than once")
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnViewDelegate() {
        // Arrange
        mockSignupWebService.shouldReturnError = true
        let expectation = expectation(description: "Expected the errorHandler method to be called")
        mockSignupViewDelegate.expectation = expectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0, "successfullSignup() method shouldnt be called")
        XCTAssertEqual(mockSignupViewDelegate.errorSignupCounter, 1, "errorHandler() method was called more than once")
        XCTAssertNotNil(mockSignupViewDelegate.signupError, "SignupError was nil")
    }

}
