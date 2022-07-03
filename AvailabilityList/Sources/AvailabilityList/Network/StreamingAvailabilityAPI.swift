//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import NetworkLayer
import Combine
protocol StreamingAvailabilityAPI: APIClient {
    func fetchAllAvailableItems(type: String, country: String, service: String, page: String) -> AnyPublisher<StreamingAvailabilityResponse?, Error>
}
