//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: DataRequestProtocol>(dataRequest: T, completion: @escaping (Result<T.Response, ErrorResponse>) -> Void)
}

extension NetworkServiceProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Movies, ErrorResponse>) -> Void) {
        request(dataRequest: MoviesRequest(page: page), completion: completion)
    }
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: DataRequestProtocol>(dataRequest: T, completion: @escaping (Result<T.Response, ErrorResponse>) -> Void) {
        guard let url = URL(string: dataRequest.url) else { return }
        var request = URLRequest(url: url)
        print(url)
        request.allHTTPHeaderFields = dataRequest.header
        request.httpMethod = dataRequest.method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.apiError))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            print(url)

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
