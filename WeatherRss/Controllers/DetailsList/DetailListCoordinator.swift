//
//  DetailListCoordinator.swift
//  WeatherRss
//
//  Created by MC_test on 14/02/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class DetailListCoordinator: Coordinator {
    private let viewModel: DetailViewModel
    private let listVC: DetailListViewController
    
    init(forecasts: Forecasts?) {
        viewModel = DetailViewModel(forecasts: forecasts)
        listVC = DetailListViewController(viewModel: viewModel)
    }
    
    func start() -> UIViewController {
        return listVC
    }
}
