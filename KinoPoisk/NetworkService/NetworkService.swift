//
//  NetworkService.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 01.05.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void)
    func prepareHeader() -> [String: String]?
    func prepareParameters(searchTerm: String?) -> [String: String]
    func url(params: [String: String]) -> URL
    func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask
}

class NetworkService: NetworkServiceProtocol {
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "GET"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["accept"] = "accept: application/json"
        headers["X-API-KEY"] = "ca070bb1-cb28-4f8a-912c-5bab25ae23e7"
        return headers
    }

    func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm // скорее всего поменять в url данные
        parameters["page"] = String(1)
        return parameters
    }

    func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kinopoiskapiunofficial.tech"
        components.path = "/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }

    func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
