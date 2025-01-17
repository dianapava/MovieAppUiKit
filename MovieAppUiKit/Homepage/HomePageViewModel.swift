//
//  HomePageViewModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 14/01/25.
//

class HomePageViewModel: BaseViewModel {
    
   private var movies: [Movie] = []
    
    private lazy var respository : MovieRepository = {
        let apiClient = ApiClient()
        return MovieRepository(apiClient: apiClient)
    }()
    
    override func viewdidload() {
        super.viewdidload()
        getMovies()
    }
    
    private func getMovies() {
        respository.getMovie { [weak self] movie in
            self?.movies = movie
        } onFailure: { error in
            print(error)
        }
    }
}
