//
//  MovieService.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(substring: String, completion: @escaping (Result<[Movie],Error>) -> Void)
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetail,Error>) -> Void)
}
