//
//  DetailViewModel.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

class DetailViewModel {
    var movieService = MovieService()
    weak var delegate: DetailViewModelDelegate?
    var selectedMovieId: String!
    var movieDetail: MovieDetail?
    
    
    func fetchMovieDetail() {
        MovieService().getMovieDetail(id: selectedMovieId) { res in
            switch res {
            case .success(let movieDetail):
                self.movieDetail = movieDetail
                if let movieDetail = self.movieDetail {
                    self.delegate?.fetchDetailsOnSuccess(movieDetail: movieDetail)
                }
               
                
            case .failure(let error):
                self.delegate?.fetchDetailsOnError(error: error)
            }
        }
    }
}
