//
//  MovieGenreObjectView.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 31/01/25.
//

import Foundation

struct GenreObjectView {
    let genreName: String
    let genreId: Int
}

struct MovieGenreObjectView {
    let movie: MovieObjectView
    let genres: String
}

struct MovieGenreModel {
    let genreName: String
    let genreId: Int
}

struct MovieObjectView {
    let titleMovie: String
    let imageMovie: String
    let votesMovie: Int
    let genresIds: [Int]
    let backgroundImageMovie: String
    
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w300\(imageMovie)")
    }
    
    var backgroundImageMovieURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(backgroundImageMovie)")

    }
}
