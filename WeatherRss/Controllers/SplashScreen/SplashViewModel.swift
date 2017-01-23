//
//  SplashViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

protocol SplashViewModelCoordinatorDelegate: class {
    func fetchCompleted(forecasts: Forecasts?)
}

protocol SplashViewModelViewDelegate: class {
    func displayError(message: String)
}


class SplashViewModel {
    var coordinatorDelegate: SplashViewModelCoordinatorDelegate?
    weak var viewDelegate: SplashViewModelViewDelegate?
    
    init() {
        getWeatherData()
    }
    
    func getWeatherData() {
        WeatherRssFeedService.getWeatherData { forecasts in
            self.coordinatorDelegate?.fetchCompleted(forecasts: forecasts)
        }
    }
}
