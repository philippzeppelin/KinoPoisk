//
//  NetworkDataFetcher.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkDataFetcherProtocol {

    func fetchMovies(searchTerm: String, completion: @escaping (Movies?) -> Void)
//    func decodeJSON()

//    func getMovies(completion: @escaping (Result<[Movies]?, Error>) -> Void)
//    func decodeJSON()
}

class NetworkDataFetcher: NetworkDataFetcherProtocol {
    var networkService = NetworkService()

    func fetchMovies(searchTerm: String, completion: @escaping (Movies?) -> Void) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: Movies.self, from: data)
            completion(decode)
        }
    }

    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }

        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError.localizedDescription)
            return nil
        }
    }

//    func getMovies(completion: @escaping (Result<[Movies]?, Error>) -> Void) {
//        let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1"
//        guard let url = URL(string: urlString) else { return }
//    }
//
//    func decodeJSON() {
//
//    }
}
