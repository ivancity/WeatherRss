//
//  AppCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    fileprivate let window: UIWindow
    fileprivate var currentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() -> UIViewController {
        let splashCoordinator = SplashCoordinator()
        splashCoordinator.coordinatorDelegate = self
        return splashCoordinator.start()
    }
}

extension AppCoordinator: SplashCoordinatorDelegate {
    func splashCoordinatorFinished() {
        //TODO Load a new ViewController screen in window
        print("new view controller on screen")
    }
}
