//
//  File 2.swift
//
//
//  Created by Sko on 3/7/22.
//

import Combine
import Foundation

class AvailabilityListViewModel: ObservableObject {

    private let coordinator: AvailabilityListCoordinator

    private var subscriptions = Set<AnyCancellable>()

    private let apiService: StreamingAvailabilityAPIService

    @Published var availableItems: [StreamingAvailabilityItem] = []

    init(coordinator: AvailabilityListCoordinator, apiService: StreamingAvailabilityAPIService) {
        self.coordinator = coordinator
        self.apiService = apiService
        fetchAllAvailableItems()
    }

    func fetchAllAvailableItems() {
        apiService.fetchAllAvailableItems(
            type: "movie", country: "gr", service: "netflix", page: "1"
        )
        .receive(on: RunLoop.main)
        .sink { completion in
            switch completion {
            case let .failure(error):
                print("Couldn't get books: \(error)")
            case .finished: break
            }
        } receiveValue: { availableItemsResponse in
            self.availableItems = availableItemsResponse?.results ?? []
        }
        .store(in: &subscriptions)
    }
}
