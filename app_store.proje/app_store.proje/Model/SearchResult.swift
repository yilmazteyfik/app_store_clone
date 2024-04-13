//
//  SearchResult.swift
//  app_store.proje
//
//  Created by Teyfik Yılmaz on 11.04.2024.
//


import Foundation
struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
struct Result: Decodable {
    let primaryGenreName: String
    let artworkUrl100: String
    let trackName: String
    let screenshotUrls: [String]
    var averageUserRating: Float?
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
    let trackId: Int
}
