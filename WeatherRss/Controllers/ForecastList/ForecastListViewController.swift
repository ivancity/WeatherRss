//
//  ForecastListViewController.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class ForecastListViewController:  UIViewController {
    fileprivate let viewModel: TableViewModel
    fileprivate let tableView = UITableView()
    
    
    init(viewModel: TableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(FirstWeatherCell.self, forCellReuseIdentifier: "firstCell")
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    private func setupTableView() {
        
    }
    
}

extension ForecastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO go to Details of Forecast chosen
    }
}

extension ForecastListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO prepare UI for cells 
        guard let rowValue = viewModel.row(at: indexPath) else {
            let emptyCell = tableView
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath)
                as! WeatherCell
            return emptyCell
        }
        switch rowValue {
        case .firstForecast(let forecast):
            let firstRow = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstWeatherCell
            firstRow.set(forecast)
            return firstRow
        case .forecast(let forecast):
            let row = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
            row.set(forecast)
            return row
        }
    }
    
}
