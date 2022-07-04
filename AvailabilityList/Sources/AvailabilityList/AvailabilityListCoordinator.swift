//
//  File 3.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import PWFCommon
import UIKit

public struct AvailabilityListRequirements: Requirements {

    let dependencies: Dependencies
    let tabbar: PWFTabbar
    
    public init(tabbar: PWFTabbar, dependencies: Dependencies) {
        self.dependencies = dependencies
        self.tabbar = tabbar
    }
}

protocol AvailabilityListCoordinator {

}

internal final class AvailabilityListCoordinatorImpl: Coordinator, AvailabilityListCoordinator {

    let dependencies: Dependencies
    let tabbar: PWFTabbar
    
    fileprivate init(requirements: AvailabilityListRequirements) {
        self.dependencies = requirements.dependencies
        self.tabbar = requirements.tabbar
    }

    func start() {
        let viewModel = AvailabilityListViewModel(coordinator: self, apiService: StreamingAvailabilityAPIService())
        let viewController = AvailabilityListViewController(viewModel: viewModel)
        let nvc = UINavigationController(rootViewController: viewController)
        nvc.tabBarItem = UITabBarItem(title: "List", image: .checkmark, selectedImage: .checkmark)

        tabbar.append(viewController: nvc)
    }

}

public struct AvailabilityListCoordinatorFactory: CoordinatorFactory {
    public init() { }
    public func makeCoordinator(for requirements: AvailabilityListRequirements) -> Coordinator {
        return AvailabilityListCoordinatorImpl(requirements: requirements)

    }
}
