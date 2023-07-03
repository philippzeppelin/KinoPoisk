//
//  MoviesRequest.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 03.07.2023.
//

import Foundation

extension NetworkServiceProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Movies, ErrorResponse>) -> Void) {
        request(dataRequest: MoviesRequest(page: page), completion: completion)
    }
}
