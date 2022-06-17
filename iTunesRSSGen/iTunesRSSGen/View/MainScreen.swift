//
//  MainScreen.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

// Calling the initial View as "screen" to indicate that it is the starting point
struct MainScreen: View {

    @StateObject var viewModel = AlbumsViewModel()

    var body: some View {
        NavigationView {
            switch viewModel.resultStates {
            case .loading:
                // MARK: - Loading
                LoadingView()

                // MARK: - Result
            case .none:
                if let album = viewModel.album, let albums = viewModel.albums {
                    NavigationView {
                        List {
                            ForEach(albums, id: \.self) { item in
                                NavigationLink {
                                    DetailView(album: album.feed, albumDetails: item)
                                } label: {
                                    RowView(albumDetails: item)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                    .navigationTitle("\(album.feed.country.uppercased()) \( album.feed.title)")
                }
                // MARK: - Error
            case .error(let err):
                ErrorView(message: err)
            }
        }
        .onAppear {
            viewModel.getAlbumsByNetworkService()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
