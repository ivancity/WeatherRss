//
//  DetailListViewController.swift
//  WeatherRss
//
//  Created by MC_test on 14/02/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {
    fileprivate let viewModel: DetailViewModel
    private let tableView = UITableView()
    fileprivate var estimatedheight: CGFloat?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Details"
        tableView.backgroundColor = .skyBlue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(DetailCell.self, forCellReuseIdentifier: "detailCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
}

extension DetailListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let estimatedheight = estimatedheight else {
            return 85.5
        }
        return estimatedheight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        estimatedheight = cell.frame.height
    }
    
}

extension DetailListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let (day, night) = viewModel.row(at: indexPath)
        
        let row = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        row.set(day: day, night: night)
        row.selectionStyle = .none
        row.backgroundColor = .deepBlue
        return row
    }
}

