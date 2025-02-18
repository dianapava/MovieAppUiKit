//
//  GenresModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 29/01/25.
//

struct GenresMovie: Codable {
    let genres: [GenreId]
}

struct GenreId: Codable {
    let id: Int
    let name: String
}
