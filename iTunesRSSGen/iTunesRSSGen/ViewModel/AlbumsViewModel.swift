//
//  AlbumsViewModel.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

enum ResultStates {
    case none
    case loading
    case error(error: String)
}

final class AlbumsViewModel: ObservableObject {

    @Published var album: Album?
    @Published var albums: [AlbumViewModel] = []
    @Published var resultStates: ResultStates = .loading

    func getAlbumsByNetworkService() {
        let endPoint = APIEndpoint.getRSSFeed

        print(endPoint)
        NetworkService().getData(endpoint: endPoint) { [weak self] (result: Result<Album, APIError>) in
            switch result {
            case .success(let album):
                DispatchQueue.main.async {
                    self?.album = album
                    self?.albums = album.feed.results.map { AlbumViewModel(album: $0) }
                    self?.resultStates = .none
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.resultStates = .error(error: error.localizedDescription)
                }
            }
        }
    }
}
