//
//  MenuCoordinator.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation
import UIKit

public struct MenuRequirements: Requirements {
    let dependencies: Dependencies
}
protocol MenuCoordinator {
    func showPopup()
}
private final class MenuCoordinatorImpl: Coordinator, MenuCoordinator {
    
    private let dependencies: Dependencies
    
    fileprivate init(requirements: MenuRequirements) {
        self.dependencies = requirements.dependencies
    }
    
    func start() {
        let viewModel = MenuViewModel(coordinator: self)
        let viewController = MenuViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.dependencies.window.rootViewController = navigationController
    }
    
    func showPopup() {
        
    }
    
}

struct MenuCoordinatorFactory: CoordinatorFactory {
    func makeCoordinator(for requirements: MenuRequirements) -> Coordinator {
        return MenuCoordinatorImpl(requirements: requirements)
    }
}
