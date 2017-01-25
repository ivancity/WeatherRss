//
//  FirstWeatherCell.swift
//  WeatherRss
//
//  Created by MC_test on 24/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class FirstWeatherCell: UITableViewCell {
    //day views
    private let dayLabel = UILabel()
    private let dayTempMaxLabel = UILabel()
    private let dayTempMinLabel = UILabel()
    private let dayWindMaxLabel = UILabel()
    private let dayWindMinLabel = UILabel()
    private let dayTempDescription = UILabel()
    private let dayWeatherText = UILabel()
    private let dayTempContainer = UIView()
    private let dayWindContainer = UIView()
    private let dayIcon = UILabel()
    //night views
    private let nightLabel = UILabel()
    private let nightTempMaxLabel = UILabel()
    private let nightTempMinLabel = UILabel()
    private let nightWindMaxLabel = UILabel()
    private let nightWindMinLabel = UILabel()
    private let nightTempDescription = UILabel()
    private let nightWeatherText = UILabel()
    private let nightTempContainer = UIView()
    private let nightWindContainer = UIView()
    private let nightIcon = UILabel()
    //other views
    private let date = UILabel()
    private let margin = 10
    private let smallMargin = 5
    private let dataHeight = 128
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .deepBlue
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
        contentView.addSubview(date)
        setupDayViews()
        setupNightViews()
    }
    
    private func addViewStyles() {
        date.font = UIFont.boldSystemFont(ofSize: 18)
        date.textColor = .whiteTwo
        dayViewStyles()
        nightViewStyles()
    }
    
    private func addViewConstraints() {
        date.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(margin)
            make.left.equalTo(contentView).offset(margin)
        }
        dayViewConstraints()
        nightViewConstraints()
    }
    
    private func setupDayViews() {
        contentView.addSubview(dayLabel)
        dayTempContainer.addSubview(dayTempMaxLabel)
        dayTempContainer.addSubview(dayTempMinLabel)
        dayWindContainer.addSubview(dayWindMaxLabel)
        dayWindContainer.addSubview(dayWindMinLabel)
        contentView.addSubview(dayTempContainer)
        contentView.addSubview(dayWindContainer)
        contentView.addSubview(dayTempDescription)
        contentView.addSubview(dayWeatherText)
    }
    
    private func setupNightViews() {
        contentView.addSubview(nightLabel)
        nightTempContainer.addSubview(nightTempMaxLabel)
        nightTempContainer.addSubview(nightTempMinLabel)
        nightWindContainer.addSubview(nightWindMaxLabel)
        nightWindContainer.addSubview(nightWindMinLabel)
        contentView.addSubview(nightTempContainer)
        contentView.addSubview(nightWindContainer)
        contentView.addSubview(nightTempDescription)
        contentView.addSubview(nightWeatherText)
    }
    
    private func dayViewStyles() {
        dayLabel.font = UIFont.systemFont(ofSize: 18)
        dayTempMaxLabel.font = UIFont.boldSystemFont(ofSize: 24)
        dayWindMaxLabel.font = UIFont.boldSystemFont(ofSize: 24)
        dayTempMinLabel.font = UIFont.systemFont(ofSize: 18)
        dayWindMinLabel.font = UIFont.systemFont(ofSize: 18)
        dayTempDescription.font = UIFont.systemFont(ofSize: 14)
        dayWeatherText.font = UIFont.systemFont(ofSize: 14)
        dayTempDescription.numberOfLines = 0
        dayWeatherText.numberOfLines = 0
        
        dayLabel.textColor = .whiteTwo
        dayTempMaxLabel.textColor = .white
        dayTempMinLabel.textColor = .white
        dayWindMaxLabel.textColor = .white
        dayWindMinLabel.textColor = .white
        dayTempDescription.textColor = .whiteThree
        dayWeatherText.textColor = .whiteThree
    }
    
    private func nightViewStyles() {
        nightLabel.font = UIFont.systemFont(ofSize: 18)
        nightTempMaxLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nightWindMaxLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nightTempMinLabel.font = UIFont.systemFont(ofSize: 18)
        nightWindMinLabel.font = UIFont.systemFont(ofSize: 18)
        nightTempDescription.font = UIFont.systemFont(ofSize: 14)
        nightWeatherText.font = UIFont.systemFont(ofSize: 14)
        nightTempDescription.numberOfLines = 0
        nightWeatherText.numberOfLines = 0
        
        nightLabel.textColor = .whiteTwo
        nightTempMaxLabel.textColor = .white
        nightTempMinLabel.textColor = .white
        nightWindMaxLabel.textColor = .white
        nightWindMinLabel.textColor = .white
        nightTempDescription.textColor = .whiteThree
        nightWeatherText.textColor = .whiteThree
    }
    
    private func dayViewConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(contentView)
        }
        
        dayTempContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView)
            make.right.equalTo(dayWindContainer.snp.left)
            make.height.equalTo(dataHeight)
            make.width.equalTo(contentView).dividedBy(2)
        }
        
        dayWindContainer.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView)
            make.left.equalTo(dayTempContainer.snp.right)
            make.height.equalTo(dataHeight)
            make.width.equalTo(contentView).dividedBy(2)
        }
        
        dayTempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayTempContainer).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
            make.height.equalTo(dayTempContainer).dividedBy(2)
        }
        
        dayTempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(dayTempMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayTempContainer)
            make.bottom.equalTo(dayTempContainer).offset(-smallMargin)
            make.height.equalTo(dayTempContainer).dividedBy(2)
        }
        
        dayWindMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayWindContainer).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
            make.height.equalTo(dayWindContainer).dividedBy(2)
        }
        
        dayWindMinLabel.snp.makeConstraints { make in
            make.top.equalTo(dayWindMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(dayWindContainer)
            make.bottom.equalTo(dayWindContainer).offset(-smallMargin)
            make.height.equalTo(dayWindContainer).dividedBy(2)
        }
        
        dayTempDescription.snp.makeConstraints { make in
            make.top.equalTo(dayTempContainer.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
        }
        
        dayWeatherText.snp.makeConstraints { make in
            make.top.equalTo(dayTempDescription.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
        }
    }
    
    private func nightViewConstraints() {
        nightLabel.snp.makeConstraints { make in
            make.top.equalTo(dayWeatherText.snp.bottom).offset(margin)
            make.centerX.equalTo(contentView)
        }
        
        nightTempContainer.snp.makeConstraints { make in
            make.top.equalTo(nightLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView)
            make.right.equalTo(nightWindContainer.snp.left)
            make.height.equalTo(dataHeight)
            make.width.equalTo(contentView).dividedBy(2)
        }
        
        nightWindContainer.snp.makeConstraints { make in
            make.top.equalTo(nightLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView)
            make.left.equalTo(nightTempContainer.snp.right)
            make.height.equalTo(dataHeight)
            make.width.equalTo(contentView).dividedBy(2)
        }
        
        nightTempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(nightTempContainer).offset(smallMargin)
            make.centerX.equalTo(nightTempContainer)
            make.height.equalTo(nightTempContainer).dividedBy(2)
        }
        
        nightTempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(nightTempMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(nightTempContainer)
            make.bottom.equalTo(nightTempContainer).offset(-smallMargin)
            make.height.equalTo(nightTempContainer).dividedBy(2)
        }
        
        nightWindMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(nightWindContainer).offset(smallMargin)
            make.centerX.equalTo(nightWindContainer)
            make.height.equalTo(nightWindContainer).dividedBy(2)
        }
        
        nightWindMinLabel.snp.makeConstraints { make in
            make.top.equalTo(nightWindMaxLabel.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(nightWindContainer)
            make.bottom.equalTo(nightWindContainer).offset(-smallMargin)
            make.height.equalTo(nightWindContainer).dividedBy(2)
        }
        
        nightTempDescription.snp.makeConstraints { make in
            make.top.equalTo(nightTempContainer.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
        }
        
        nightWeatherText.snp.makeConstraints { make in
            make.top.equalTo(nightTempDescription.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin)
            make.right.equalTo(contentView).offset(-margin)
            make.bottom.equalTo(contentView).offset(-margin)
        }
    }
    
    func set(_ forecast: Forecast) {
        date.text = forecast.date
        //day binding
        dayTempMaxLabel.text = forecast.day?.tempMaxFormatted
        dayTempMinLabel.text = forecast.day?.tempMinFormatted
        dayWindMaxLabel.text = forecast.day?.windMaxFormatted
        dayWindMinLabel.text = forecast.day?.windMinFormatted
        dayTempDescription.text = forecast.day?.temperatureAsPhrase()
        dayWeatherText.text = "\((forecast.day?.description)!)"
        //night binding
        nightTempMaxLabel.text = forecast.night?.tempMaxFormatted
        nightTempMinLabel.text = forecast.night?.tempMinFormatted
        nightWindMaxLabel.text = forecast.night?.windMaxFormatted
        nightWindMinLabel.text = forecast.night?.windMinFormatted
        nightTempDescription.text = forecast.night?.temperatureAsPhrase()
        nightWeatherText.text = "\((forecast.night?.description)!)"
    }
}
