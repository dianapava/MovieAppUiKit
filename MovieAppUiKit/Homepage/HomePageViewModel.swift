//
//  HomePageViewModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 14/01/25.
//

protocol HomePageViewModelProtocol: ViewModelProtocol {
    var showMovies: ([Movie]) -> () { get set }
}

final class HomePageViewModel: BaseViewModel, HomePageViewModelProtocol {
    var showMovies: ([Movie]) -> () = { _ in }
    
    private var movies: [Movie] = []
    private let repository: MovieRepositoryProtocol
    init(respository: MovieRepositoryProtocol) {
        self.repository = respository
    }

    override func viewDidLoad() {
        getMovies()
    }
    
    private func getMovies() {
        repository.getMovie { [weak self] movies in
            self?.movies = movies
            self?.showMovies(movies)
        } onFailure: { error in
            print(error)
        }
    }
}
