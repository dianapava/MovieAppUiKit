//
//  ApiClient.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

import Foundation

enum ClientError: Error {
    case urlInvalid
    case dataInvalid
}

protocol ApiClientProtocol {
    func request<T: Codable>(endpoint: Endpoint, onSuccess: @escaping (T) -> (), onFailure: @escaping (Error) -> ())
}


class ApiClient: ApiClientProtocol {
    
    private let request: URLRequestFactoryProtocol
    
    init(request: URLRequestFactoryProtocol = URLRequestFactory()) {
        self.request = request
    }
    
    func request<T: Codable>(endpoint: any Endpoint, onSuccess: @escaping (T) -> (), onFailure: @escaping (any Error) -> ()){
        guard let url = URL(string: endpoint.url) else {
            onFailure(ClientError.urlInvalid)
            return
        }
        
        let request = self.request.createRequest(endpoint: endpoint)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                onFailure(error)
            } else {
                guard let data = data else {
                    onFailure(ClientError.dataInvalid)
                    return
                }
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    onSuccess(model)
                } catch (let error){
                    onFailure(error)
                }
            }
        }.resume()
    }
}
