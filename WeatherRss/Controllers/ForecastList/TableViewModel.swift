//
//  TableViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class TableViewModel {
    
    fileprivate var forecasts: Forecasts?
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        guard let forecasts = forecasts,
            let forecastArray = forecasts.forecasts else {
                return 0
        }
        return forecastArray.count

    }
    
    init(forecasts: Forecasts?) {
        self.forecasts = forecasts
    }
}
