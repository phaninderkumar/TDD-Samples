//
//  SignupWebServiceProtocol.swift
//  PhotosApp
//
//  Created by Phaninder on 19/10/22.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
