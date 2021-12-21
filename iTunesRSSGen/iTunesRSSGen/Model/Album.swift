//
//  Album.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let feed: Feed
}


// MARK: - Feed
struct Feed: Codable {
    let title: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let artistName, id, name: String
    let artistID: String
    let artistURL: String
    let artworkUrl100: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, name
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, url
    }
}

// MARK: - Dummy data for previews
extension Album {
    static let dummyFeed: Album = Album(feed:
                                            Feed(title: "Top albums",
                                                 country: "us",
                                                 icon: "https://www.apple.com/favicon.ico",
                                                 updated: "Tue, 21 Dec 2021 09:53:28 +0000",
                                                 results: [Result(artistName: "Roddy Ricch",
                                                                  id: "1", name: "LIVE LIFE FAST",
                                                                  artistID: "12",
                                                                  artistURL: "https://music.apple.com/us/artist/roddy-ricch/1212442072", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music126/v4/3a/bf/02/3abf028a-7bd2-8d42-c10a-d0ca1d9f85d7/075679762580.jpg/100x100bb.jpg",
                                                                  url: "https://music.apple.com/us/album/live-life-fast/1598011282")]))
}
