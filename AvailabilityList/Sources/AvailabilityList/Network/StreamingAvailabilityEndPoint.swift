//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import NetworkLayer

struct Constants {
    static let baseUrl = "https://streaming-availability.p.rapidapi.com/"
    static let apiKey = "b1fdefff1cmsh45a9af340dbe7ddp1ac0abjsn80c99b5ee0d0"
}
struct FetchAllAvailableItemsRequest: Endpoint {

    let type: String
    let country: String
    let service: String
    let page: String

    var params: [URLQueryItem] {
        return [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "service", value: service),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "page", value: page),
        ]
    }

    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    var path: String {
        "search/basic"
    }

    var method: HTTPRequestMethod {
        .get
    }

    var headers: [String: String]? {
        return ["X-RapidAPI-Key": Constants.apiKey]
    }
}
