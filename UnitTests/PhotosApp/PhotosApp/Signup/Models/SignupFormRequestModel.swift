//
//  SignupFormRequestModel.swift
//  PhotosApp
//
//  Created by Phaninder on 18/10/22.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
