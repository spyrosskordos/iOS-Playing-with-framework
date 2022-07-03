//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import PWFCommon

public struct PWFTabbarRequirements: Requirements {

    let screens: [PWFTabbarScreen]
    let dependencies: Dependencies

    public init(screens: [PWFTabbarScreen], dependencies: Dependencies) {
        self.screens = screens
        self.dependencies = dependencies
    }
}

protocol PWFCoordinator {

}

private final class PWFTabbarCoordinatorImpl: Coordinator, PWFCoordinator {

    let dependencies: Dependencies
    let screens: [PWFTabbarScreen]

    fileprivate init(requirements: PWFTabbarRequirements) {
        self.dependencies = requirements.dependencies
        self.screens = requirements.screens
    }

    func start() {
        let viewModel = PWFTabbarViewModel(coordinator: self)
        let viewController = PWFTabbarViewController(viewModel: viewModel)
        dependencies.window.rootViewController = viewController
    }
}

public struct PWFTabbarCoordinatorFactory: CoordinatorFactory {

    public init() { }

    public func makeCoordinator(for requirements: PWFTabbarRequirements) -> Coordinator {
        return PWFTabbarCoordinatorImpl(requirements: requirements)
    }

}

