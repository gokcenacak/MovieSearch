//
//  Movie.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation

struct MovieBase: Decodable {
    let Search: [Movie]
}

struct Movie: Decodable {
    let Title: String?
    let Year: String?
    let Poster: String?
    let imdbID: String?
}

struct MovieDetail: Decodable {
   let Title, Year, Rated, Released: String?
   let Runtime, Genre, Director, Writer: String?
   let Actors, Plot, Language, Country: String?
   let Awards: String?
   let Poster: String?
   let Ratings: [Rating]?
   let Metascore, imdbRating, imdbVotes, imdbID: String?
   let `Type`, Dvd, BoxOffice, Production: String?
   let Website, Response: String?
}

struct Rating: Codable {
    let source, value: String?
}

