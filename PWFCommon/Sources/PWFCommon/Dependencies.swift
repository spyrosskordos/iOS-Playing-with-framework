//
//  Dependencies.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import UIKit

public protocol CoordinatorFactoryProvider {
    func makeCoordinatorFactory<Factory: CoordinatorFactory>(
        for requirements: Factory.R
    ) -> Factory
    func menuCoordinator(dependencies: Dependencies) -> Coordinator
    func pwfTabbarCoordinator(screens: [PWFTabbarScreen],dependencies: Dependencies) -> Coordinator
    func enterListIDCoordinator(presentingViewController: UIViewController, dependencies: Dependencies) -> Coordinator
}

public struct Dependencies {
    
    public let window: UIWindow
    public let coordinatorFactoryProvider: CoordinatorFactoryProvider
    
   public init(window: UIWindow, coordinatorFactoryProvider: CoordinatorFactoryProvider) {
        self.window = window
        self.coordinatorFactoryProvider = coordinatorFactoryProvider
    }
    
}
