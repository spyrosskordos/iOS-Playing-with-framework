//
//  MenuCoordinator.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation
import UIKit
import PWFCommon

public struct MenuRequirements: Requirements {
    
    let dependencies: Dependencies
   
    public init (dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
protocol MenuCoordinator {
    func showPopup()
}

private final class MenuCoordinatorImpl: Coordinator, MenuCoordinator {
    
    private let dependencies: Dependencies
    private var presentingViewController: UIViewController? {
        return dependencies.window.rootViewController
    }
    
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
        guard let presentingViewController = self.presentingViewController else {
            return
        }
        
        dependencies.coordinatorFactoryProvider.enterListIDCoordinator(presentingViewController: presentingViewController, dependencies: dependencies).start()
    }
    
}

public struct MenuCoordinatorFactory: CoordinatorFactory {
    public init() { }
    public func makeCoordinator(for requirements: MenuRequirements) -> Coordinator {
        return MenuCoordinatorImpl(requirements: requirements)
    }
}

public struct MockMenuCoordinator: MenuCoordinator {
    func showPopup() {
        
    }
}
