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
    var body: String { get }
    var path: String { get }
    var method: String { get }
    var header: [String: String] { get }
}
