//
//  NetworkService.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Foundation

final class NetworkService {
    func buildURL(endpoint: API) -> URLComponents {
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.baseURL
        components.path = endpoint.path
        return components
    }

    func getData<T: Codable>(endpoint: API, completion: @escaping(Result<T, APIError>) -> Void) {
        let components = buildURL(endpoint: endpoint)

        guard let url = components.url else {
            completion(.failure(APIError.invalidURL))
            return
        }

        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(APIError.networkError(error.localizedDescription)))
                return
            }

            guard response != nil, let data = data else {
                return
            }

            if let responseData = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(responseData))
            } else {
                completion(.failure(APIError.decodingError))
            }
        }
        dataTask.resume()
    }
}
