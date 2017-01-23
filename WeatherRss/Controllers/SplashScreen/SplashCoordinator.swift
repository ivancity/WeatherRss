//
//  SplashCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

protocol SplashCoordinatorCoordinatorDelegate: class {
    func splashCoordinatorFinished(forecasts: Forecasts?)
}

class SplashCoordinator: Coordinator {
    weak var coordinatorDelegate: SplashCoordinatorCoordinatorDelegate?
    private let splashVc: SplashViewController
    private let viewModel: SplashViewModel
    
    init() {
        viewModel = SplashViewModel()
        splashVc = SplashViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
    }
    
    func start() -> UIViewController {
        return splashVc
    }
}

extension SplashCoordinator: SplashViewModelCoordinatorDelegate {
    func fetchCompleted(forecasts: Forecasts?) {
        coordinatorDelegate?.splashCoordinatorFinished(forecasts: forecasts)
    }
}
