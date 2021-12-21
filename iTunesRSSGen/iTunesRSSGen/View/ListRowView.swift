//
//  ListRowView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

struct ListRowView: View {
    
    let album: Result
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: album.artworkUrl100))
                .clipShape(RoundedRectangle(cornerRadius: 3))
            VStack(alignment: .leading, spacing: 2) {
                Text("\(album.name)")
                    .font(.title3.bold())
                Text("\(album.artistName)")
                    .font(.body)
            }
            .padding(.horizontal)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(album: Album.dummyFeed.feed.results[0])
            .previewLayout(.sizeThatFits)
    }
}
