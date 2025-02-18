//
//  URLRequestFactory.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 16/01/25.
//
import Foundation

protocol URLRequestFactoryProtocol {
    func createRequest(endpoint: Endpoint) throws -> URLRequest
}

struct URLRequestFactory: URLRequestFactoryProtocol {
    func createRequest(endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: endpoint.url) else {
            throw ClientError.urlInvalid
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = endpoint.headers
        return request
    }
}
