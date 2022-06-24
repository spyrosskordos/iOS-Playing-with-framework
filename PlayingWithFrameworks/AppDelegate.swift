//
//  AppDelegate.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 19/6/22.
//

import UIKit
import Menu
import PWFCommon
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var dependencies: Dependencies!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        self.window = window
        self.dependencies = Dependencies(window: window,coordinatorFactoryProvider: PWFCoordinatorFactoryProvider())
        self.dependencies.coordinatorFactoryProvider
            .menuCoordinator(dependencies: self.dependencies)
            .start()
        window.makeKeyAndVisible()
        
        return true
    }

    


}

