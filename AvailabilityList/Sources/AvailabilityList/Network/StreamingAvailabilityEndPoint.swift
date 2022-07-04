//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import NetworkLayer

enum StreamingAvailabilityEndpoint {
    case fetchAllAvailableItems(type: String, country: String, service: String, page: String)

    struct Constants {
        static let baseUrl = "https://streaming-availability.p.rapidapi.com/"
        static let apiKey = "b1fdefff1cmsh45a9af340dbe7ddp1ac0abjsn80c99b5ee0d0"
        static let searchEndpoint = "search/basic?"
    }
}

extension StreamingAvailabilityEndpoint: Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError("baseURL could not be configured.") }
        return url
    }

    var path: String {
        switch self {
        case .fetchAllAvailableItems(let type, let country, let service, let page):
            return Constants.searchEndpoint + "country=\(country)&service=\(service)&type=\(type)&page=\(page)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }

    var method: HTTPRequestMethod {
        switch self {
        case .fetchAllAvailableItems:
            return .get
        }
    }

    var headers: [String: String]? {
        switch self {
        case .fetchAllAvailableItems:
            return ["X-RapidAPI-Key": Constants.apiKey]
        }
    }
}
