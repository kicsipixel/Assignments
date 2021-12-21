//
//  AlbumsViewModel.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Combine
import SwiftUI

enum ResultStates {
    case none
    case loading
    case error(error: String)
}

final class AlbumsViewModel: ObservableObject {
    
    @Published var album: Album? = nil
    @Published var resultStates: ResultStates = .loading
    
    private let networkService = NetworkService.instance
    
    var cancellable: AnyCancellable?
    
    init() {
        getAlbumsByNetworkService()
    }
    
    func getAlbumsByNetworkService() {
        cancellable = networkService.getAlbums()
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .finished:
                    // TODO: handle this properly
                    print("Data received.")
                    self.resultStates = .none
                case .failure(let err):
                    self.resultStates = .error(error: err.localizedDescription)
                }
            }, receiveValue: { receivedAlbum in
                self.album = receivedAlbum
            })
    }
}
