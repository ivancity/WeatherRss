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
    private let dayTempContainer = UIView()
    private let dayWindContainer = UIView()
    private let margin = 10
    private let smallMargin = 5
    
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
        dayLabel.text = "Day"
        nightLabel.text = "Night"
        dayTempContainer.addSubview(tempMaxLabel)
        dayTempContainer.addSubview(tempMinLabel)
        dayWindContainer.addSubview(windMaxLabel)
        dayWindContainer.addSubview(windMinLabel)
        contentView.addSubview(date)
        contentView.addSubview(dayLabel)
        contentView.addSubview(dayTempContainer)
        contentView.addSubview(dayWindContainer)
        contentView.addSubview(tempDescription)
        contentView.addSubview(weatherText)
        
        //contentView.addSubview(nightLabel)
    }
    
    private func addViewStyles() {
        date.font = UIFont.boldSystemFont(ofSize: 16)
        tempMaxLabel.font = UIFont.boldSystemFont(ofSize: 20)
        windMaxLabel.font = UIFont.boldSystemFont(ofSize: 20)
        tempMinLabel.font = UIFont.systemFont(ofSize: 16)
        windMinLabel.font = UIFont.systemFont(ofSize: 16)
        dayLabel.font = UIFont.systemFont(ofSize: 18)
        nightLabel.font = UIFont.systemFont(ofSize: 12)
        tempDescription.font = UIFont.systemFont(ofSize: 12)
        weatherText.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func addViewConstraints() {
        date.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(margin)
            make.left.equalTo(contentView).offset(margin)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(contentView)
        }
        
        dayTempContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView)
            make.right.equalTo(dayWindContainer.snp.left)
            make.size.equalTo(contentView).dividedBy(2)
        }
        
        dayWindContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView)
            make.left.equalTo(dayTempContainer.snp.right)
            make.size.equalTo(contentView).dividedBy(2)
        }
        
        tempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayTempContainer).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
            make.height.equalTo(dayTempContainer).dividedBy(2)
        }
        
        tempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(tempMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
            make.bottom.equalTo(dayTempContainer).offset(-smallMargin)
            make.height.equalTo(dayTempContainer).dividedBy(2)
        }
        
        windMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayWindContainer).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
            make.height.equalTo(dayWindContainer).dividedBy(2)
        }
        
        windMinLabel.snp.makeConstraints { make in
            make.top.equalTo(windMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
            make.bottom.equalTo(dayWindContainer).offset(-smallMargin)
            make.height.equalTo(dayWindContainer).dividedBy(2)
        }
        
        tempDescription.snp.makeConstraints { make in
            make.top.equalTo(dayTempContainer.snp.bottom)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
        }
        
        weatherText.snp.makeConstraints { make in
            make.top.equalTo(tempDescription.snp.bottom)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
            make.bottom.equalTo(contentView).offset(-margin)
        }
    }
    
    func set(_ forecast: Forecast) {
        date.text = forecast.date
        tempMaxLabel.text = forecast.day?.tempMaxFormatted
        tempMinLabel.text = forecast.day?.tempMinFormatted
        windMaxLabel.text = forecast.day?.windMaxFormatted
        windMinLabel.text = forecast.day?.windMinFormatted
        weatherText.text = "\((forecast.day?.description)!)"
    }
    
}
