//
//  NetworkService.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Combine
import Foundation

final class NetworkService {
    
    static let instance = NetworkService()
    
    func getAlbums() -> AnyPublisher<Album, Error> {
        
        guard let url = URL(string: ApiEndpoint.urlString) else {
            let error = URLError(.badURL, userInfo: [NSURLErrorKey: "Something went wrong with the address..."])
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: Album.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
