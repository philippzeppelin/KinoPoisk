//
//  DataRequest.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 13.06.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol DataRequestProtocol {
    associatedtype Response
    var body: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String] { get }
    var url: String { get }

    func decode(_ data: Data) throws -> Response
}

extension DataRequestProtocol where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
