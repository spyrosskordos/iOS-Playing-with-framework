//
//  File.swift
//  
//
//  Created by Sko on 23/6/22.
//

import Foundation
import PWFCommon
import UIKit
public struct EnterListIDRequirements: Requirements {
    let presentingViewController: UIViewController
    let dependencies: Dependencies
    
    public init (dependencies: Dependencies,presentingViewController: UIViewController) {
        self.dependencies = dependencies
        self.presentingViewController = presentingViewController
    }
}

protocol EnterListIDCoordinator {
    func showList()
}

private final class EnterListIDCoordinatorImpl: Coordinator,EnterListIDCoordinator {
    
    private let dependencies: Dependencies
   
    fileprivate init(requirements: EnterListIDRequirements){
        self.dependencies = requirements.dependencies
    }
    
    func start() {
        let viewModel = EnterListIDViewModel(coordinator: self)
        let viewController = EnterListIDViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
    }
    
    func showList() {
        
    }
    
}

public struct  EnterListIDFactory: CoordinatorFactory {
    public init() { }

   public func makeCoordinator(for requirements: EnterListIDRequirements) -> Coordinator {
        return EnterListIDCoordinatorImpl(requirements: requirements)
    }
}
