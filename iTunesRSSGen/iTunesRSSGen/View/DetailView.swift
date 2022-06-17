//
//  DetailView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 17.06.2022.
//  Copyright © 2022 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    @Environment(\.openURL) var openURL
    let album: Feed
    let albumDetails: AlbumViewModel

    var body: some View {
        content
    }

    @ViewBuilder var content: some View {
        VStack {
            Spacer()

            // MARK: Album image
            if let url = URL(string: albumDetails.albumArt) {
                AsyncImage(url: url, scale: 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            // MARK: Album title
            Text("\(albumDetails.albumTitle)")
                .font(.title2)
                .bold()
            // MARK: Artist
            Text("\(albumDetails.artistName)")
                .font(.title3)
            // MARK: Release date
            Text("\(albumDetails.albumReleaseDate)")
                .font(.footnote)
            // MARK: Genre
            Text("\(albumDetails.albumGenre)")
                .font(.footnote)
            // MARK: Copyright
            Text("\(album.copyright)")
                .font(.caption)
                .padding(.top, 20)

            Spacer()

            // MARK: Play button
            Button {
                guard let url = URL(string: albumDetails.albumURL) else {
                    return
                }
                openURL(url)
            } label: {
                Text("Play in Apple Music")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(album: Album.dummyFeed, albumDetails: AlbumViewModel(album: Album.dummyFeedResult))
    }
}
