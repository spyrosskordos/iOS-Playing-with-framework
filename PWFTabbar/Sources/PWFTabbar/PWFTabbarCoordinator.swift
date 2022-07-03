//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation
import PWFCommon

public struct PWFTabbarRequirements: Requirements {

    let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

protocol PWFCoordinator {

}

private final class PWFTabbarCoordinatorImpl: Coordinator, PWFCoordinator {

    let dependencies: Dependencies

    fileprivate init(requirements: PWFTabbarRequirements) {
        self.dependencies = requirements.dependencies
    }

    func start() {
        let viewModel = PWFTabbarViewModel(coordinator: self)
        let viewController = PWFTabbarViewController(viewModel: viewModel)
        dependencies.coordinatorFactoryProvider.availabilityListCoordinator(tabbar: viewController, dependencies: dependencies).start()
        dependencies.window.rootViewController = viewController
       
    }
}

public struct PWFTabbarCoordinatorFactory: CoordinatorFactory {

    public init() { }

    public func makeCoordinator(for requirements: PWFTabbarRequirements) -> Coordinator {
        return PWFTabbarCoordinatorImpl(requirements: requirements)
    }

}

