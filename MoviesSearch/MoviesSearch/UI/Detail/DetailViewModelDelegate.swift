//
//  DetailViewModelDelegate.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func fetchDetailsOnSuccess(movieDetail: MovieDetail)
    func fetchDetailsOnError(error: Error)
}
