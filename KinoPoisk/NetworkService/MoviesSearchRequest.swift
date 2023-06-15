//
//  MoviesSearchRequest.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 14.06.2023.
//

import Foundation

struct MoviesRequest: DataRequestProtocol {
    typealias Response = Movies

    var body: String = "https://kinopoiskapiunofficial.tech/"
    var path: String = "api/v2.2/films/top?page="
    var method: HTTPMethod = .get
    var header: [String: String] = ["X-API-KEY": "ca070bb1-cb28-4f8a-912c-5bab25ae23e7"]
//    var page: Int

    var url: String {
        return body + path
    }
}
