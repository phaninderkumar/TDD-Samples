//
//  SignupViewDelegateProtocol.swift
//  PhotosApp
//
//  Created by Phaninder on 19/10/22.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
