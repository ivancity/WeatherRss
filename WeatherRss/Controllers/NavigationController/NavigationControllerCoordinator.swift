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
    fileprivate let detailListCoordinator: DetailListCoordinator
    private var forecasts: Forecasts?
    fileprivate let navController = UINavigationController()
    
    init(forecasts: Forecasts?) {
        self.forecasts = forecasts
        tableViewCoordinator = TableViewCoordinator(forecasts: forecasts)
        detailListCoordinator = DetailListCoordinator(forecasts: forecasts)
        tableViewCoordinator.coordinatorDelegate = self
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

extension NavigationControllerCoordinator: TableViewModelCoordinatorCoordinatorDelegate {
    func openDetailList() {
        let detailListVC = detailListCoordinator.start()
        navController.pushViewController(detailListVC, animated: true)
    }
}

