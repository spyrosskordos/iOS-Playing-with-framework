//
//  Dependencies.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 23/6/22.
//

import UIKit

struct Dependencies {
    
    let window: UIWindow
    let coordinatorFactoryProvider: CoordinatorFactoryProvider
    
    init(window: UIWindow, coordinatorFactoryProvider: CoordinatorFactoryProvider = PWFCoordinatorFactoryProvider()) {
       self.window = window
       self.coordinatorFactoryProvider = coordinatorFactoryProvider
   }
   
}
