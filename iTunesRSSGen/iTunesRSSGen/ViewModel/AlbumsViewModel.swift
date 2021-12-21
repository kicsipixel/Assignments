//
//  AlbumsViewModel.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Combine
import SwiftUI

final class AlbumsViewModel: ObservableObject {
    
    @Published var album: Album? = nil
    @Published var completionMessage: String? = nil
    
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
                    self.completionMessage = "Data received."
                case .failure(let err):
                    self.completionMessage = err.localizedDescription
                }
            }, receiveValue: { receivedAlbum in
                self.album = receivedAlbum
            })
    }
}
