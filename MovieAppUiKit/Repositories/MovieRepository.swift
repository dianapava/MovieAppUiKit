//
//  MovieRepository.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

class MovieRepository {
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getMovie(onSuccess:  @escaping ([Movie]) -> (), onFailure:  @escaping (Error) -> ()) {
        let endpoint = MovieEndpoint()
        apiClient.request(endpoint: endpoint) { (model: MovieModel) in
            onSuccess(model.results)
            print(model.results)
        } onFailure: { error in
            onFailure(error)
        }
    }
}
