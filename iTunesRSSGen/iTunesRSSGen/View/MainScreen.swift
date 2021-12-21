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
            if albumsVM.album != nil {
                List {
                    ForEach(albumsVM.album!.feed.results, id:\.id) { album in
                        Text(album.name)
                    }
                }
                .navigationTitle("\(albumsVM.album!.feed.title)")
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
