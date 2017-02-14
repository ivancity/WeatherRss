//
//  TableViewModel.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

protocol ListViewModel {
    associatedtype Value
    func row(at indexPath: IndexPath) -> Value?
}

protocol TableViewModelCoordinatorDelegate: class {
    func openDetailList()
}

class TableViewModel {
    
    enum Row {
        case firstForecast(Forecast)
        case forecast(Forecast)
    }
    
    weak var coordinatorDelegate: TableViewModelCoordinatorDelegate?
    
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
    
    func forecastSelected() {
        coordinatorDelegate?.openDetailList()
    }
}

extension TableViewModel: ListViewModel {
    func row(at indexPath: IndexPath) -> Row? {
        guard let forecastArray = forecasts?.forecasts else {
            return nil
        }
        if indexPath.row == 0 {
            return .firstForecast(forecastArray[indexPath.row])
        }
        return .forecast(forecastArray[indexPath.row])
    }
}
