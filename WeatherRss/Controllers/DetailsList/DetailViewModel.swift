//
//  DetailViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 14/02/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class DetailViewModel {
    var forecasts: Forecasts?
    init(forecasts: Forecasts?) {
        self.forecasts = forecasts
    }
}
