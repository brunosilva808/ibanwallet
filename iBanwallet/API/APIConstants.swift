//
//  APIConstants.swift
//  iBanwallet
//
//  Created by Carbon on 21/11/2018.
//

import Foundation

struct APIConstants {
    struct ProductionServer {
        static let baseURL = "https://api.github.com"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
