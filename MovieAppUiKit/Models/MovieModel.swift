//
//  MovieModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

import Foundation

struct MovieModel: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int
    let original_title: String
    let overview: String
    let poster_path: String
    let backdrop_path: String
    let genre_ids: [Int]
    let vote_count: Int
    
    
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
}
