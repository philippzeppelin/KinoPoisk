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
