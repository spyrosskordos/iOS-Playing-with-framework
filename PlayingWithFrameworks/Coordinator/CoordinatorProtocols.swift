//
//  Coordinator.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation
protocol Coordinator {
    func start()
}
protocol Requirements {}

protocol CoordinatorFactory {
    associatedtype R: Requirements
    
    init()
    func makeCoordinator(for requirements: R) -> Coordinator
}
