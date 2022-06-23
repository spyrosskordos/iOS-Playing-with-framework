//
//  CoordinatorFactoryProvider.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation

protocol CoordinatorFactoryProvider {
    func makeCoordinatorFactory<Factory: CoordinatorFactory>(
        for requirements: Factory.R
    ) -> Factory
    func menuCoordinator(dependencies: Dependencies) -> Coordinator
}

struct PWFCoordinatorFactoryProvider: CoordinatorFactoryProvider {
    
    func makeCoordinatorFactory<Factory: CoordinatorFactory>(for requirements: Factory.R) -> Factory {
        return Factory()
    }
    
    func menuCoordinator(dependencies: Dependencies) -> Coordinator {
        let requirements = MenuRequirements(dependencies: dependencies)
        return MenuCoordinatorFactory().makeCoordinator(for: requirements)
    }
    
    
}
