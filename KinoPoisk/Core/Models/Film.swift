//
//  Film.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.06.2023.
//

import Foundation

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
