//
//  GenreEndpoint.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 29/01/25.
//
import Foundation

struct GenreEndpoint: Endpoint {
    var url: String = "https://api.themoviedb.org/3/genre/movie/list"
    var httpMethod: HTTPMethod = .get
    var headers: [String : String] =  [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNhMjNiNDA0YTVkYzRmZDRhN2NiZjAxNGEzYzYxOCIsIm5iZiI6MTY4Mzg1NDI2OC42NDYwMDAxLCJzdWIiOiI2NDVkOTNiY2Q2YzMwMDAxMDNkNzZhMDMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.L9PqQtKH1oblZSDKKZAS81BuVxTa7j4jMtRg9gk7Aq4"
    ]
}
