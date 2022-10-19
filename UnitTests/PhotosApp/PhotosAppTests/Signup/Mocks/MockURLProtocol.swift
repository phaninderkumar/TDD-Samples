//
//  MockURLProtocol.swift
//  PhotosAppTests
//
//  Created by Phaninder on 19/10/22.
//

import Foundation

class MockURLProtocol: URLProtocol {
 
    static var stubResponseData: Data?
    static var stubError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let validError = MockURLProtocol.stubError {
            let error = NSError(domain: "testingError", code: -99, userInfo: [NSLocalizedDescriptionKey: validError.localizedDescription])
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        // Can be left empty
    }
}
