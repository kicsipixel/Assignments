//
//  AlbumViewModel.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 17.06.2022.
//  Copyright © 2022 Szabolcs Tóth. All rights reserved.
//

import Foundation

struct AlbumViewModel: Hashable {
    static func == (lhs: AlbumViewModel, rhs: AlbumViewModel) -> Bool {
        lhs.albumID == rhs.albumID && lhs.albumTitle == rhs.albumTitle && lhs.artistName == rhs.artistName && lhs.artistID == rhs.artistID
    }

    let album: FeedResult

    var albumTitle: String {
        album.name
    }

    var albumID: String {
        album.id
    }

    var artistName: String {
        album.artistName
    }

    var artistID: String {
        album.artistID
    }

    var albumArt: String {
        album.artworkUrl100
    }

    var albumGenre: String {
        album.genres[0].name
    }

    var albumReleaseDate: String {
        album.releaseDate
    }

    var albumURL: String {
        album.url
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(artistID)
    }
}
