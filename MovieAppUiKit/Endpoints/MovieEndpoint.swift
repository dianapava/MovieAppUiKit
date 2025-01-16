//
//  MovieEndpoint.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//
import Foundation


struct MovieEndpoint: Endpoint {
    var url = "https://api.themoviedb.org/3/movie/popular"
    var httpMethod: HTTPMethod = .get
    var headers: [String : String] =  [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWNhMjNiNDA0YTVkYzRmZDRhN2NiZjAxNGEzYzYxOCIsIm5iZiI6MTY4Mzg1NDI2OC42NDYwMDAxLCJzdWIiOiI2NDVkOTNiY2Q2YzMwMDAxMDNkNzZhMDMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.L9PqQtKH1oblZSDKKZAS81BuVxTa7j4jMtRg9gk7Aq4"
      ]
}
