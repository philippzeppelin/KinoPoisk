//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

// в нетворк сервис
protocol NetworkServiceProtocol {
    func request<T: DataRequestProtocol>(dataRequest: T, completion: @escaping (Result<T.Response, ErrorResponse>) -> Void)
}

extension NetworkServiceProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Movies, ErrorResponse>) -> Void) {
        request(dataRequest: MoviesRequest(), completion: completion)
    }
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: DataRequestProtocol>(dataRequest: T, completion: @escaping (Result<T.Response, ErrorResponse>) -> Void) {
        guard let url = URL(string: dataRequest.url) else { return }
        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = dataRequest.header
        request.httpMethod = dataRequest.method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.apiError))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                try completion(.success(dataRequest.decode(data)))
            } catch {
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}

//    func getMovies(page: Int, completion: @escaping (Result<Movies, Error>) -> Void) {
//        let popularMoviesURL = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?page=\(page)"
//        guard let url = URL(string: popularMoviesURL) else { return }
//        var request = URLRequest(url: url)
//
//        request.allHTTPHeaderFields = ["X-API-KEY": "ca070bb1-cb28-4f8a-912c-5bab25ae23e7"]
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                print("DataTask error: \(error.localizedDescription)")
//            }
//
//            guard let response = response as? HTTPURLResponse,
//                  response.statusCode == 200 else {
////                completion(.failure())
//                return
//            }
//
//            guard let data = data else {
//                print("Data is nil")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let movie = try decoder.decode(Movies.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(movie))
//                }
//            } catch let error {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//        task.resume()
//    }
// }
