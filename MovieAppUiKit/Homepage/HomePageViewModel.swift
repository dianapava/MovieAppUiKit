//
//  HomePageViewModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 14/01/25.
//

class HomePageViewModel {
    
    var movies: [Movie] = []
    
    private lazy var respository : MovieRepository = {
        let apiClient = ApiClient()
        return MovieRepository(apiClient: apiClient)
    }()
    
    func viewdidload() {
        getMovies()
    }
    
    func getMovies() {
        respository.getMovie { movie in
            self.movies = movie
        } onFailure: { error in
            print(error)
        }
    }
}
