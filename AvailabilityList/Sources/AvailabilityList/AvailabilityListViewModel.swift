//
//  File 2.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import Combine
class AvailabilityListViewModel {

    private let coordinator: AvailabilityListCoordinator
    private var subscriptions = Set<AnyCancellable>()

    private let apiService: StreamingAvailabilityAPIService

    init(coordinator: AvailabilityListCoordinator, apiService: StreamingAvailabilityAPIService) {
        self.coordinator = coordinator
        self.apiService = apiService
    }
    
    func fetchAllAvailableItems() {
        apiService.fetchAllAvailableItems(type: "movie", country: "gr", service: "netflix", page: "1")
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Couldn't get books: \(error)")
                case .finished: break
                }
            } receiveValue: { booksResult in
                print("received books: \(booksResult?.results ?? [])")
            }
            .store(in: &subscriptions)
    }
}
