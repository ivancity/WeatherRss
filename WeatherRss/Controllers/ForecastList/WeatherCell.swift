//
//  WeatherCell.swift
//  WeatherRss
//
//  Created by MC_test on 24/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    private let date = UILabel()
    private let dayLabel = UILabel()
    private let margin = 10
    private let smallMargin = 5
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addViewConstraints()
        addViewStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        dayLabel.text = "Day"
        contentView.addSubview(date)
        contentView.addSubview(dayLabel)
    }
    
    private func addViewConstraints() {
        date.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(margin)
            make.left.equalTo(contentView).offset(margin)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-margin)
        }
    }
    
    private func addViewStyles() {
        date.font = UIFont.boldSystemFont(ofSize: 16)
        dayLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    func set(_ forecast: Forecast) {
        date.text = forecast.date
    }
    
}
