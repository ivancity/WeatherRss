//
//  DetailViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 14/02/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class DetailViewModel {
    private var forecast: Forecast?
    
    var numberOfSections: Int {
        return 1
    }
    var numberOfRows: Int {
        if let num = forecast?.day?.placeArray?.count {
            return num
        }
        return 0
    }

    init(forecasts: Forecasts?) {
        self.forecast = forecasts?.forecasts?[0]
    }
    
    func row(at indexPath: IndexPath) -> (Place?, Place?) {
        guard let placeDay = forecast?.day?.placeArray?[indexPath.row] else {
            return (nil, nil)
        }
        
        guard let placeNight = forecast?.night?.placeArray?[indexPath.row] else {
            return (nil, nil)
        }
        
        return (placeDay, placeNight)
    }
}
