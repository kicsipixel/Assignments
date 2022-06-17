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
    let id: String
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [FeedResult]
}

// MARK: - Result
struct FeedResult: Codable {
    let artistName, id, name, releaseDate: String
    let kind, artistID: String
    let artistURL: String
    let contentAdvisoryRating: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case contentAdvisoryRating, artworkUrl100, genres, url
    }
}

// MARK: - Genre
struct Genre: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}

// MARK: - Dummy data for previews
extension Album {
    static let dummyFeed = Feed(title: "US", id: "1234567", copyright: "Apple", country: "ud", icon: "", updated: "", results: [dummyFeedResult])

    static let dummyFeedResult = FeedResult(artistName: "Drake",
                                            id: "12345678",
                                            name: "Best of Drake and Friends",
                                            releaseDate: "2022-01-02",
                                            kind: "albums",
                                            artistID: "0987654321",
                                            artistURL: "https://music.apple.com/us/artist/drake/271256",
                                            contentAdvisoryRating: "Explicit",
                                            artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music122/v4/84/2c/b4/842cb419-243c-b3f4-4da9-b6b980996062/22UMGIM67371.rgb.jpg/100x100bb.jpg",
                                            genres: [Genre(name: "Dance")],
                                            url: "https://music.apple.com/us/album/honestly-nevermind/1630230040")
}
