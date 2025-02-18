//
//  HomePageViewModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 14/01/25.
//

import Foundation

protocol HomePageViewModelProtocol: ViewModelProtocol {
    var showMovies: ([MovieGenreObjectView]) -> () { get set }
    var backGroundMovie: (MovieGenreObjectView) -> () { get set }
    func willDisplay(index: Int)
}

final class HomePageViewModel: BaseViewModel, HomePageViewModelProtocol {
    var showMovies: ([MovieGenreObjectView]) -> () = { _ in }
    var backGroundMovie: (MovieGenreObjectView) -> () = { _ in }
    
    private var movies = [MovieGenreObjectView]()
    
    private let repository: MovieRepositoryProtocol
    init(respository: MovieRepositoryProtocol) {
        self.repository = respository
    }

    override func viewDidLoad() {
        getMovies()
    }
    
    private func getMovies() {
        let myGroup = DispatchGroup()
        var genrelist = [GenreObjectView]()
        var movieList = [MovieObjectView]()
        
        myGroup.enter()
        repository.getMovie { movies in
            movieList = movies.map{ MovieObjectView(titleMovie: $0.original_title, imageMovie: $0.poster_path, votesMovie: $0.vote_count, genresIds: $0.genre_ids, backgroundImageMovie: $0.backdrop_path)}
            myGroup.leave()
        } onFailure: { error in
            print(error)
            myGroup.leave()
        }
        
        myGroup.enter()
        repository.getGenreMovie { genres in
            genrelist = genres.map { GenreObjectView(genreName: $0.name, genreId: $0.id)}
            myGroup.leave()
        } onFailure: {error in
            print(error)
            myGroup.leave()
        }
        
        myGroup.notify(queue: .main) { [weak self] in
            self?.map(genrelist: genrelist, movieList: movieList)
        }
    }
    
    func map(genrelist: [GenreObjectView], movieList: [MovieObjectView]) {
        var movies = [MovieGenreObjectView]()
        for movie in movieList {
            var genreIds = [String]()
            for genre in genrelist {
                for id in movie.genresIds {
                    if id == genre.genreId {
                        genreIds.append(genre.genreName)
                    }
                }
            }
            
            let genre = genreIds.joined(separator: ", ")
            movies.append(MovieGenreObjectView(movie: movie, genres: genre))
        }
        self.movies = movies
        showMovies(movies)
    }
    
    func willDisplay(index: Int) {
        let movie = movies[index]
        let genres = movie.genres
        backGroundMovie(MovieGenreObjectView(movie: movie.movie, genres: genres))
    }
}
