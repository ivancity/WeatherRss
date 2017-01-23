//
//  NavigationControllerCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerCoordinator: Coordinator {
    
    fileprivate let tableViewCoordinator: TableViewCoordinator
    private var forecasts: Forecasts?
    fileprivate let navController = UINavigationController()
    
    init(forecasts: Forecasts?) {
        self.forecasts = forecasts
        tableViewCoordinator = TableViewCoordinator(forecasts: forecasts)
    }
    
    func start() -> UIViewController {
        return navigationViewController()
    }
    
    private func navigationViewController() -> UINavigationController {
        //load ForecastListController
        let forecastListVC = tableViewCoordinator.start()
        navController.viewControllers = [forecastListVC]
        return navController
    }
}

