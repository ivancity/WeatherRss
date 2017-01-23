//
//  TableViewCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class TableViewCoordinator: Coordinator {
    
    private let viewModel: TableViewModel
    private let listVC: ForecastListViewController
    
    init(forecasts: Forecasts?) {
        viewModel = TableViewModel(forecasts: forecasts)
        listVC = ForecastListViewController(viewModel: viewModel)
    }
    
    func start() -> UIViewController {
        return listVC
    }
}
