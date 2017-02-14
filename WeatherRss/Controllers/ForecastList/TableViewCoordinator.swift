//
//  TableViewCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

protocol TableViewModelCoordinatorCoordinatorDelegate: class {
    func openDetailList()
}

class TableViewCoordinator: Coordinator {
    
    private let viewModel: TableViewModel
    private let listVC: ForecastListViewController
    weak var coordinatorDelegate: TableViewModelCoordinatorCoordinatorDelegate?
    
    init(forecasts: Forecasts?) {
        viewModel = TableViewModel(forecasts: forecasts)
        listVC = ForecastListViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
    }
    
    func start() -> UIViewController {
        return listVC
    }
}

extension TableViewCoordinator: TableViewModelCoordinatorDelegate {
    func openDetailList() {
        coordinatorDelegate?.openDetailList()
    }
}
