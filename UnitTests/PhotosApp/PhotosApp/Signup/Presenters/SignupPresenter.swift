//
//  SignupPresenter.swift
//  PhotosApp
//
//  Created by Phaninder on 19/10/22.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {    

    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private var viewDelegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, viewDelegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.viewDelegate = viewDelegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        let signupRequestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: signupRequestModel) { [weak self] responseModel, error in
            if let _ = responseModel {
                self?.viewDelegate?.successfullSignup()
            } else if let signupError = error {
                self?.viewDelegate?.errorHandler(error: signupError)
            } else {
                self?.viewDelegate?.errorHandler(error: SignupError.failedRequest(description: "Unknown Error"))
            }
        }
    }
    
}
