//
//  HomeViewModel.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

class HomeViewModel {
    var movieService = MovieService()
    weak var delegate: HomeViewModelDelegate?
    var movieList: [Movie]?
    
    init(delegate: HomeViewModelDelegate){
        self.delegate = delegate
    }
    
    func fetchMovies(searchString: String) {
        MovieService().fetchMovies(substring: searchString) { res in
            switch res {
            case .success(let movies):
                self.movieList = movies

                if let movieList = self.movieList {
                    self.delegate?.fetchMoviesOnSuccess(movieList: movieList)
                }
                
            case .failure(let error):
                self.delegate?.fetchMoviesOnError(error: error)
            }
        }
    }
}
