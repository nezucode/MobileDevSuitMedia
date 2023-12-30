//
//  Endpoint.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import Foundation

enum Endpoint {
    
    case fetchUsers(url: String = "/api/users?page=1&per_page=10")

    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValues(for: self)
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme // https
        components.host = Constants.baseURL // example.com:5000
        components.port = Constants.port //
        components.path = self.path // /v1/cryptocurrency/listings/latest
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .fetchUsers(let url):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .fetchUsers:
            return [
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "per_page", value: "10")
            ]
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .fetchUsers:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchUsers:
            return nil
        }
    }
    
}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
           case .fetchUsers:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
