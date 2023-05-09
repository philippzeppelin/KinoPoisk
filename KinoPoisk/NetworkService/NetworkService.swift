//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Movies, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private var task: URLSessionDataTask?

    func getMovies(page: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
        let popularMoviesURL = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?page=\(page)"
        guard let url = URL(string: popularMoviesURL) else { return }
        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = ["X-API-KEY": "ca070bb1-cb28-4f8a-912c-5bab25ae23e7"]
        request.httpMethod = "GET"

        // create URLSession
        task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("Response is nil")
//                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
//                completion(.failure())
                print("Data is nil")
                return
            }

            do {
                // Parse the data
                let decoder = JSONDecoder()
                let movie = try decoder.decode(Movies.self, from: data)
//                print(String(data: data, encoding: .utf8)!)
                DispatchQueue.main.async {
                    completion(.success(movie))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task?.resume()
    }
}
