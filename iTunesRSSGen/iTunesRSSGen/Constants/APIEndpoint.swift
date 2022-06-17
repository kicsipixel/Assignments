//
//  APIEndpoint.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum HTTPScheme: String {
    case https
}

protocol API {
    var scheme: HTTPScheme { get }

    var baseURL: String { get }

    var path: String { get }

    var method: HTTPMethod { get }
}

enum APIEndpoint: API {

    case getRSSFeed

    var scheme: HTTPScheme {
        switch self {
        case .getRSSFeed:
            return .https
        }
    }

    var baseURL: String {
        switch self {
        case .getRSSFeed:
            return "rss.applemarketingtools.com"
        }
    }

    var path: String {
        switch self {
        case .getRSSFeed:
            return "/api/v2/us/music/most-played/50/albums.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getRSSFeed:
            return .get
        }
    }
}
