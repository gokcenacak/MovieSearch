//
//  HomeViewModelProtocol.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func fetchMoviesOnSuccess(movieList: [Movie])
    func fetchMoviesOnError(error: Error)
}
