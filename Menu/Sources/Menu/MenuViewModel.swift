//
//  MenuViewModel.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    private let coordinator: MenuCoordinator
    
    init(coordinator: MenuCoordinator){
        self.coordinator = coordinator
    }
    
    func listTapped() {
        coordinator.showPopup()
    }
}
