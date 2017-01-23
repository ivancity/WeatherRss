//
//  SplashViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

protocol SplashViewModelCoordinatorDelegate: class {
    func fetchCompleted()
}

protocol SplashViewModelViewDelegate: class {
    func displayError(message: String)
}


class SplashViewModel {
    
    weak var coordinatorDelegate: SplashViewModelCoordinatorDelegate? {
        didSet {
            getWeatherData()
        }
    }
    weak var viewDelegate: SplashViewModelViewDelegate?
    
    init() {
        //getWeatherData()
    }
    
    private func getWeatherData() {
        //TODO do something here to fetch from network all data
        //self.coordinatorDelegate?.fetchCompleted()
        
        WeatherRssFeedService.getWeatherData()
        
    }
}
