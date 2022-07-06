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
    func pwfTabbarCoordinator(dependencies: Dependencies) -> Coordinator
    func availabilityListCoordinator(tabbar: PWFTabbar,dependencies: Dependencies) -> Coordinator
}

public struct Dependencies {
    
    public let window: UIWindow
    public let coordinatorFactoryProvider: CoordinatorFactoryProvider
    
   public init(window: UIWindow, coordinatorFactoryProvider: CoordinatorFactoryProvider) {
        self.window = window
        self.coordinatorFactoryProvider = coordinatorFactoryProvider
    }
    
}
