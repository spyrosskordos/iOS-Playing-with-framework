//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import Combine

struct StreamingAvailabilityAPIService: StreamingAvailabilityAPI {

    func fetchAllAvailableItems(type: String, country: String, service: String,page: String) -> AnyPublisher<StreamingAvailabilityResponse?, Error> {
        return fetch(
            endpoint: StreamingAvailabilityEndpoint
                .fetchAllAvailableItems(
                type: type,
                country: country,
                service: service,
                page: page
            ),
            type: StreamingAvailabilityResponse?.self)
    }
}
