//
//  APIManager.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

//https://www.omdbapi.com/?apikey=f5133d7&t=batman
class MovieService: MovieServiceProtocol {
    
    func fetchMovies(substring: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        var components = URLComponents(string: GlobalConstants.URL)!

        components.queryItems = [
            URLQueryItem(name: "apikey", value: GlobalConstants.apiKey),
            URLQueryItem(name: "s", value: substring)
        ]
        
        let request = URLRequest(url: components.url!)

        URLSession.shared.dataTask(with: request) { data, res, error in
                   guard let data = data else { return }
                   DispatchQueue.main.async {
                       do {
                           let movies = try JSONDecoder().decode(MovieBase.self, from: data)
                           completion(.success(movies.Search))
                       } catch {
                           completion(.failure(error))
                       }
                
                   }
        }.resume()
    }
    
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        var components = URLComponents(string: GlobalConstants.URL)!

        components.queryItems = [
            URLQueryItem(name: "apikey", value: GlobalConstants.apiKey),
            URLQueryItem(name: "i", value: id)
        ]
        
        let request = URLRequest(url: components.url!)

        URLSession.shared.dataTask(with: request) { data, res, error in
                   guard let data = data else { return }
                   DispatchQueue.main.async {
                       do {
                           let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                           completion(.success(movieDetail))
                       } catch {
                           completion(.failure(error))
                       }
                
                   }
        }.resume()
    }
}
