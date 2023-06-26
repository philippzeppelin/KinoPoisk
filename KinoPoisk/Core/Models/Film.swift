//
//  Film.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.06.2023.
//

import Foundation

struct FilmAPI: Decodable {
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

struct Film {
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

extension Film {
    init(_ filmAPI: FilmAPI) {
        self.filmId = filmAPI.filmId
        self.nameRu = filmAPI.nameRu
        self.nameEn = filmAPI.nameEn
        self.year = filmAPI.year
        self.filmLength = filmAPI.filmLength
        self.countries = filmAPI.countries
        self.genres = filmAPI.genres
        self.rating = filmAPI.rating
        self.ratingVoteCount = filmAPI.ratingVoteCount
        self.posterUrl = filmAPI.posterUrl
        self.posterURLPreview = filmAPI.posterURLPreview
    }
}

extension Film {
    var allGenres: String {
        return genres.map { $0.genre }.joined(separator: ", ")
    }
}

extension Film {
    var allCountries: String {
        return countries.map { $0.country }.joined(separator: ", ")
    }
}
