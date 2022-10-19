//
//  SignupFormModelValidator.swift
//  PhotosApp
//
//  Created by Phaninder on 18/10/22.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool {
        var returnValue = true
        
        if email.count < SignupConstants.emailMinLength {
            returnValue = false
        }
        if !email.contains(".") || !email.contains("@") {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength || password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }

        return returnValue
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
