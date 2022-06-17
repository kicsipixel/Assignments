//
//  APIError.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 17.06.2022.
//  Copyright © 2022 Szabolcs Tóth. All rights reserved.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case networkError(_ errorMessage: String)
    case responseError(_ statusCode: Int)
    case dataError
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Cannot find data where they should be."
        case .networkError(let error):
            return "\(error)"
        case .responseError(let statusCode):
            return "The server hasn't responded as expected.(\(statusCode)). Please, try again later."
        case .dataError:
            return "Something wrong with the data, they cannot be read."
        case .decodingError:
            return "We cannot process the respond from the server."
        }
    }
}
