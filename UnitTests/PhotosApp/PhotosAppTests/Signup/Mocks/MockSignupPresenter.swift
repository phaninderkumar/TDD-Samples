//
//  MockSignupPresenter.swift
//  PhotosAppTests
//
//  Created by Phaninder on 19/10/22.
//

import Foundation
@testable import PhotosApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false
 
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, viewDelegate: SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
    
}
