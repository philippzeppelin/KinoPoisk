//
//  Movies.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import Foundation

struct Movies: Codable {
    var pagesCount: Int
    var films: [Film]
}

struct Film: Codable {
    var filmId: Int
    var nameRu: String
    var nameEn: String?
    var year: String
    var filmLength: String
    var countries: [Countries]
    var genres: [Genres]
    var rating: String
    var ratingVoteCount: Int
    var posterUrl: String
    var posterURLPreview: String?
}

struct Countries: Codable {
    var country: String
}

struct Genres: Codable {
    var genre: String
}
