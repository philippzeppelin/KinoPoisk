//
//  ErrorResponse.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 04.05.2023.
//

import Foundation

enum ErrorResponse: String, Error {
    case apiError
    case invalidEndPoint
    case invalidResponse
    case noData
    case serializationError

    public var description: String {
        switch self {
        case .apiError: return "Ooops, there is something problem with the api"
        case .invalidEndPoint: return "Ooops, there is something problem with the endpoint"
        case .invalidResponse: return "Ooops, there is something problem with the response"
        case .noData: return "Ooops, there is something problem with the data"
        case .serializationError: return "Ooops, there is something problem with the serialization process"
        }
    }
}
