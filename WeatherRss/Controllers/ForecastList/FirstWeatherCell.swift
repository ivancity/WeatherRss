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
        //dayTempContainer.addSubview(tempMaxLabel)
        //dayTempContainer.addSubview(tempMinLabel)
        //dayWindContainer.addSubview(windMaxLabel)
        //dayWindContainer.addSubview(windMinLabel)
        contentView.addSubview(date)
        contentView.addSubview(dayLabel)
        //contentView.addSubview(nightLabel)
        //contentView.addSubview(dayTempContainer)
        //contentView.addSubview(dayWindContainer)
        //contentView.addSubview(tempDescription)
        //contentView.addSubview(weatherText)
        
    }
    
    private func addViewStyles() {
        date.font = UIFont.boldSystemFont(ofSize: 16)
        tempMaxLabel.font = UIFont.boldSystemFont(ofSize: 16)
        windMaxLabel.font = UIFont.boldSystemFont(ofSize: 16)
        tempMinLabel.font = UIFont.systemFont(ofSize: 12)
        windMinLabel.font = UIFont.systemFont(ofSize: 12)
        dayLabel.font = UIFont.systemFont(ofSize: 12)
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
            make.bottom.equalTo(contentView).offset(-margin)
        }
        
        //helper()
    }
    
    func helper() {
        dayTempContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin)
            make.width.equalTo(30)
        }
        
        dayWindContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView).offset(margin)
            make.width.equalTo(30)
        }
        
        tempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayTempContainer).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
        }
        
        tempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(tempMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
            make.bottom.equalTo(dayTempContainer).offset(-smallMargin)
        }
        
        windMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayWindContainer).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
        }
        
        windMinLabel.snp.makeConstraints { make in
            make.top.equalTo(windMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
            make.bottom.equalTo(dayWindContainer).offset(-smallMargin)
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
        //tempMaxLabel.text = String(describing: forecast.day?.tempMax!)
        //tempMinLabel.text = String(describing: forecast.day?.tempMin!)
        //windMaxLabel.text = String(describing: forecast.day?.windMax!)
        //windMinLabel.text = String(describing: forecast.day?.windMin!)
        //weatherText.text = String(describing: forecast.day?.description!)
    }
    
}
