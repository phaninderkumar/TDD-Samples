//
//  SignupPresenterProtocol.swift
//  PhotosApp
//
//  Created by Phaninder on 19/10/22.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, viewDelegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
