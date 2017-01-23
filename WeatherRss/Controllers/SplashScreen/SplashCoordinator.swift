//
//  SplashCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

protocol SplashCoordinatorDelegate: class {
    func splashCoordinatorFinished()
}

class SplashCoordinator: Coordinator {
    weak var coordinatorDelegate: SplashCoordinatorDelegate?
    private let splashVc: SplashViewController
    private let viewModel: SplashViewModel
    
    init() {
        viewModel = SplashViewModel()
        splashVc = SplashViewController(viewModel: viewModel)
        //viewModel.coordinatorDelegate = self
    }
    
    func start() -> UIViewController {
        viewModel.coordinatorDelegate = self
        return splashVc
    }
}

extension SplashCoordinator: SplashViewModelCoordinatorDelegate {
    func fetchCompleted() {
        coordinatorDelegate?.splashCoordinatorFinished()
    }
}
