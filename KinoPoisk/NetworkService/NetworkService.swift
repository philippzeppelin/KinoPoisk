//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

class NetworkService {
    private var task: URLSessionDataTask?

    func getPopularMoviesData(page: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
        let popularMoviesURL = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?page=1"
        print("Лена ")
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

            guard let response = response as? HTTPURLResponse else {
                print("Empty Response") // добавить коды response
                return
            }

            guard let data = data else {
                print("Empty data")
                return
            }

            do {
                // Parse the data
                let decoder = JSONDecoder()
                let model = try decoder.decode(Movies.self, from: data)
                print(String(data: data, encoding: .utf8)!)
                print("филипп балбес")
                DispatchQueue.main.async {
                    completion(.success(model))
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
