//
//  NetworkError.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(String)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Decoding Error"
        case .serverError(let message):
            return message
        case .unknown:
            return "Unknown Error"
        }
    }
}
