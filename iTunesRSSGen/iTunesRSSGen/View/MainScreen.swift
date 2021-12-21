//
//  MainScreen.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

// Calling the initial View as "screen" to indicate that it is the starting point
struct MainScreen: View {
    
    @StateObject var albumsVM = AlbumsViewModel()
    
    var body: some View {
        NavigationView {
            switch albumsVM.resultStates {
            case .loading:
                LoadingView()
            case .none:
                List {
                    ForEach(albumsVM.album!.feed.results, id:\.id) { album in
                        ListRowView(album: album)
                    }
                }
                .navigationTitle("\(albumsVM.album!.feed.country.uppercased()) \(albumsVM.album!.feed.title)")
                .listStyle(PlainListStyle())
            case .error(let err):
                ErrorView(message: err)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
