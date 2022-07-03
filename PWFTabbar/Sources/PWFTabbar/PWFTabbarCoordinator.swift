//
//  File.swift
//  
//
//  Created by Sko on 3/7/22.
//

import Foundation
import PWFCommon
public struct PWFCommonRequirements: Requirements {
    let viewControllers: [PWFTabbarScreen]
    let dependencies: Dependencies
}

protocol PWFCoordinator {
    
}

private final class PWFTabbarCoordinatorImpl: Coordinator,PWFCoordinator {
    func start() {
        
    }
}

public struct PWFTabbarCoordinatorFactory: CoordinatorFactory {
    
    public init() {}
    
    
}

