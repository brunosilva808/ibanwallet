//
//  WSManager.swift
//  Move Me
//
//  Created by Bruno Silva on 10/04/2018.
//  Copyright © 2018 Bruno Silva. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

enum WSEndpoint:URLRequestConvertible {
    
    case gists
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .gists:
            return "/gists/public"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .gists:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}

class APIClient {
    
    static let shared = APIClient()
    let realmManager: RealmManager
    
    private init() {
        realmManager = RealmManager()
    }

}
