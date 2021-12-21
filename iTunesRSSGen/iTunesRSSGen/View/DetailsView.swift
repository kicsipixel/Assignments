//
//  DetailsView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.openURL) var openURL
    
    let album: Result
    let copyright: String
    
    var body: some View {
        VStack(spacing: 30) {
            
            Spacer()
            
            VStack {
                AsyncImage(url: URL(string: album.artworkUrl100), scale: 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                VStack(spacing: 3) {
                    Text("\(album.name)")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    Text("\(album.artistName)")
                        .font(.title)
                    Text("\(album.releaseDate)")
                    Text("\(album.genres[0].name)")
                }
            }
            
            Text("\(copyright)")
                .font(.caption)
            
            Spacer()
            
            Button {
                guard let url = URL(string: album.url) else { return }
                print(url)
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(album: Album.dummyFeed.feed.results[0], copyright: Album.dummyFeed.feed.copyright)
    }
}
