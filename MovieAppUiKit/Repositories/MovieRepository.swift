//
//  MovieRepository.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

protocol MovieRepositoryProtocol {
    func getMovie(onSuccess:  @escaping ([Movie]) -> (), onFailure:  @escaping (Error) -> ())
    func getGenreMovie(onSuccess:  @escaping ([GenreId]) -> (), onFailure:  @escaping (Error) -> ())
}

class MovieRepository: MovieRepositoryProtocol {
    
    private let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getMovie(onSuccess:  @escaping ([Movie]) -> (), onFailure:  @escaping (Error) -> ()) {
        let endpoint = MovieEndpoint()
        apiClient.request(endpoint: endpoint) { [weak self] (model: MovieModel) in
           onSuccess(model.results)
        } onFailure: { error in
            onFailure(error)
        }
    }
    
    func getGenreMovie(onSuccess:  @escaping ([GenreId]) -> (), onFailure:  @escaping (Error) -> ()) {
        let endpoint = GenreEndpoint()
        apiClient.request(endpoint: endpoint) { (genre: GenresMovie) in
            onSuccess(genre.genres)
        } onFailure: { error in
            onFailure(error)
        }
    }
}
