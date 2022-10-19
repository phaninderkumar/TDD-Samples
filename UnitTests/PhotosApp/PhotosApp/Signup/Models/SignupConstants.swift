//
//  SignupConstants.swift
//  PhotosApp
//
//  Created by Phaninder on 18/10/22.
//

import Foundation

struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 10

    static let emailMinLength = 5

    static let passwordMinLength = 5
    static let passwordMaxLength = 15
    static let signupURLString = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
}
