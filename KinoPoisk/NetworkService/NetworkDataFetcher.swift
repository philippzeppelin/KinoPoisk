//
//  NetworkDataFetcher.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkDataFetcherProtocol {
    func fetchMovies(completion: @escaping (Result<[Movies], Error>) -> Void)
}

class NetworkDataFetcher: NetworkDataFetcherProtocol {

    func fetchMovies(completion: @escaping (Result<[Movies], Error>) -> Void) {
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?page=1") else { return }

//        self.currentPage += 1

        var request = URLRequest(url: url)
        request.setValue("ca070bb1-cb28-4f8a-912c-5bab25ae23e7", forHTTPHeaderField: "X-API-KEY")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let data = data, let topFilms = try? JSONDecoder().decode(Movies.self, from: data) {
                DispatchQueue.main.async {
//                    self.dataStorage.fillingFilmsWithData(data: topFilms)
//                    completion(.success(self.dataStorage.transmittingFilmsArray))
                }
            } else {
//                self.currentPage -= 1
                guard let error = error else { return }
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
