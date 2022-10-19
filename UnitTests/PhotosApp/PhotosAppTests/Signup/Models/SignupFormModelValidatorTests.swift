//
//  SignupFormModelValidatorTests.swift
//  PhotosAppTests
//
//  Created by Phaninder on 18/10/22.
//

import XCTest
@testable import PhotosApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignupFormModelValidator_WhenFirstNameProvided_ShouldReturnTrue() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Phaninder")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "P")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but returned TRUE")
    }
    
    func testSignupFormMoelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Phaninder Kumar")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenLastNameProvided_ShouldReturnTrue() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Kumar")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "K")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Phaninder Kumar")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "phaninder@gmail.com")
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortEmailProvided_ShouldReturnFalse() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "p@g.")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that is shorter than \(SignupConstants.emailMinLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "phaninder")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that does not contain . and @ characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenPasswordProvided_ShouldReturnTrue() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isLastNameValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "123456789101112131415")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isLastNameValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }

}
