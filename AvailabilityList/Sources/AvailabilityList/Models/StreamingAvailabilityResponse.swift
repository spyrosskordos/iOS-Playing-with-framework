//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation

// MARK: - Welcome
struct StreamingAvailabilityResponse: Codable {
    let results: [StreamingAvailabilityItem]
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct StreamingAvailabilityItem: Identifiable, Codable {
    let id: String
    let imdbRating: Int
    let backdropPath: String
    let title: String
    let posterURLs: PosterURLs
    let streamingInfo: StreamingInfo

    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case imdbRating, backdropPath, title, posterURLs, streamingInfo
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(imdbRating, forKey: .imdbRating)
        try container.encode(backdropPath, forKey: .backdropPath)
        try container.encode(posterURLs, forKey: .posterURLs)
        try container.encode(streamingInfo, forKey: .streamingInfo)
        try container.encode(title, forKey: .title)
        }
}

// MARK: - BackdropURLs
struct BackdropURLs: Codable {
    let the300, the780, the1280, original: String

    enum CodingKeys: String, CodingKey {
        case the300 = "300"
        case the780 = "780"
        case the1280 = "1280"
        case original
    }
}

// MARK: - PosterURLs
struct PosterURLs: Codable {
    let the92, the154, the185, the342: String
    let the500, the780, original: String

    enum CodingKeys: String, CodingKey {
        case the92 = "92"
        case the154 = "154"
        case the185 = "185"
        case the342 = "342"
        case the500 = "500"
        case the780 = "780"
        case original
    }
}

// MARK: - StreamingInfo
struct StreamingInfo: Codable {
    let netflix: Netflix
}

// MARK: - Netflix
struct Netflix: Codable {
    let gr: Gr
}

// MARK: - Gr
struct Gr: Codable {
    let link: String
    let added, leaving: Int
}
