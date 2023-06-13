//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

// собирать url для мувис
struct MoviesRequest: DataRequestProtocol {
    var body: String = "https://kinopoiskapiunofficial.tech/"
    var path: String = "api/v2.2/films/top?page="
    var method: String = HTTPMethod.get.rawValue
    var header: [String: String] = ["X-API-KEY": "ca070bb1-cb28-4f8a-912c-5bab25ae23e7"]
//    var pageCount: Int надо придумать как впендюрить page
}

// в нетворк сервис
protocol NetworkServiceProtocol {
//    func getMovies(page: Int, completion: @escaping (Result<Movies, Error>) -> Void)

    func request<T: Decodable>(request: DataRequestProtocol, completion: @escaping (Result<T, ErrorResponse>) -> Void)
}

extension NetworkServiceProtocol {
    func getMovies(completion: @escaping (Result<Movies, ErrorResponse>) -> Void) {
        request(request: MoviesRequest(), completion: completion)
    }
}

final class NetworkService: NetworkServiceProtocol {
    func request<T>(request: DataRequestProtocol, completion: @escaping (Result<T, ErrorResponse>) -> Void) {






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
//}
