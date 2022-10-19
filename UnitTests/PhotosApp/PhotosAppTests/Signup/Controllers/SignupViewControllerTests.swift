//
//  SignupViewControllerTests.swift
//  PhotosAppTests
//
//  Created by Phaninder on 19/10/22.
//

import XCTest
@testable import PhotosApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard?
    var sut: SignupViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        let firstNameTextField = try XCTUnwrap(sut?.firstNameTextField, "firstNameTextField is not connected to an IBOutlet")
        XCTAssertEqual(firstNameTextField.text, "", "Expected empty string in the firstNameTextField")
        
        let lastNameTextField = try XCTUnwrap(sut?.lastNameTextField, "lastNameTextField is not connected to an IBOutlet")
        XCTAssertEqual(lastNameTextField.text, "", "Expected empty string in the lastNameTextField")
        
        let emailTextField = try XCTUnwrap(sut?.emailTextField, "emailTextField is not connected to an IBOutlet")
        XCTAssertEqual(emailTextField.text, "", "Expected empty string in the emailTextField")
        
        let passwordTextField = try XCTUnwrap(sut?.passwordTextField, "passwordTextField is not connected to an IBOutlet")
        XCTAssertEqual(passwordTextField.text, "", "Expected empty string in the passwordTextField")
        
        let repeatPasswordTextField = try XCTUnwrap(sut?.repeatPasswordTextField, "repeatPasswordTextField is not connected to an IBOutlet")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Expected empty string in the repeatPasswordTextField")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut?.signupButton, "SignupButton is not connected to an IBOutlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1, "Signup button touchup inside events should be only 1")
        XCTAssertEqual(signupButtonActions.first, "signupButton_TouchUpInside:", "There is no action assigned named signupButton_TouchUpInside to signupButton")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, viewDelegate: mockSignupViewDelegate)
        
        sut?.signupPresenter = mockSignupPresenter
        
        // Act
        sut?.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "processUserSignup() method was not called in the presenter when signup button was tapped.")
    }
    
}
