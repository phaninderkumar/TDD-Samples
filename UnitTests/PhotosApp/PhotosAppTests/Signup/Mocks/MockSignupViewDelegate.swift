//
//  MockSignupViewDelegate.swift
//  PhotosAppTests
//
//  Created by Phaninder on 19/10/22.
//

import Foundation
import XCTest
@testable import PhotosApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorSignupCounter = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorSignupCounter += 1
        expectation?.fulfill()
    }

    
}
