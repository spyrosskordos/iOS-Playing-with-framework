//
//  CoordinatorFactoryProvider.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation
import Menu
import PWFCommon
import UIKit
import EnterListID
import PWFTabbar
import AvailabilityList
struct PWFCoordinatorFactoryProvider: CoordinatorFactoryProvider {

    func makeCoordinatorFactory<Factory: CoordinatorFactory>(for requirements: Factory.R) -> Factory {
        return Factory()
    }

    func menuCoordinator(dependencies: Dependencies) -> Coordinator {
        let requirements = MenuRequirements(dependencies: dependencies)
        return MenuCoordinatorFactory().makeCoordinator(for: requirements)
    }

    func enterListIDCoordinator(presentingViewController: UIViewController, dependencies: Dependencies) -> Coordinator {
        let requirements = EnterListIDRequirements(dependencies: dependencies, presentingViewController: presentingViewController)
        return EnterListIDFactory().makeCoordinator(for: requirements)
    }

    func pwfTabbarCoordinator(dependencies: Dependencies) -> Coordinator {
        let requirements = PWFTabbarRequirements(dependencies: dependencies)
        return PWFTabbarCoordinatorFactory().makeCoordinator(for: requirements)
    }

    func availabilityListCoordinator(tabbar: PWFTabbar, dependencies: Dependencies) -> Coordinator {
        let requirements = AvailabilityListRequirements(tabbar: tabbar, dependencies: dependencies)
        return AvailabilityListCoordinatorFactory().makeCoordinator(for: requirements)
    }
}
