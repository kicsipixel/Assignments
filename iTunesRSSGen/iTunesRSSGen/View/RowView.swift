//
//  RowView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 17.06.2022.
//  Copyright © 2022 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct RowView: View {

    let albumDetails: AlbumViewModel

    var body: some View {
        content
            .frame(height: 100)
    }

    @ViewBuilder var content: some View {
        HStack {
            // MARK: - Album image
            if let url = URL(string: albumDetails.albumArt) {
                AsyncImage(url: url)
                    .frame(width: 50, height: 50)
                    .padding(20)
            }
            // MARK: - Album title and artist
            VStack(alignment: .leading) {
                Text("\(albumDetails.albumTitle)")
                    .font(.title3)
                    .bold()
                Text("\(albumDetails.artistName)")
                    .font(.body)
            }
            .padding(.leading, 10)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Preview in light mode
            RowView(albumDetails: AlbumViewModel(album: Album.dummyFeedResult))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)

            // Preview in dark mode
            RowView(albumDetails: AlbumViewModel(album: Album.dummyFeedResult))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
