//
//  SignupError.swift
//  PhotosApp
//
//  Created by Phaninder on 18/10/22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsing
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidRequestURLString, .responseModelParsing:
            return ""
        }
    }
}
