//
//  FirstWeatherCell.swift
//  WeatherRss
//
//  Created by MC_test on 24/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class FirstWeatherCell: UITableViewCell {
    private let dayLabel = UILabel()
    private let nightLabel = UILabel()
    private let tempMaxLabel = UILabel()
    private let tempMinLabel = UILabel()
    private let windMaxLabel = UILabel()
    private let windMinLabel = UILabel()
    private let tempDescription = UILabel()
    private let weatherText = UILabel()
    private let date = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addViewConstraints()
        addViewStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
    }
    
    private func addViewConstraints() {
        
    }
    
    private func addViewStyles() {
        
    }
    
    func set(_ forecast: Forecast) {
        
    }
    
}
