//
//  Endpoint.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint{
    var url: String { get set }
    var httpMethod: HTTPMethod { get set }
    var headers: [String: String] { get set }
}
