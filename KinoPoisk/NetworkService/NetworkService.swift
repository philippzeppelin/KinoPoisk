//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(dataRequest: any DataRequestProtocol, completion: @escaping (Result<T, ErrorResponse>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
//    func request<T: DataRequestProtocol>(dataRequest: T, completion: @escaping (Result<T.Response, ErrorResponse>) -> Void) {
    func request<T: Decodable>(dataRequest: any DataRequestProtocol,
                               completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        guard let url = URL(string: dataRequest.url) else { return }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = dataRequest.header
        request.httpMethod = dataRequest.method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
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
                let decodedData = try dataRequest.decode(data) as? T
                if let decodedData = decodedData {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(.serializationError))
                }
            } catch {
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}
