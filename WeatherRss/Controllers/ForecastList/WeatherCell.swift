//
//  WeatherCell.swift
//  WeatherRss
//
//  Created by MC_test on 24/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    //day views
    private let dayLabel = UILabel()
    private var daytempMaxTitle = UILabel()
    private var daytempMinTitle = UILabel()
    private let dayTempMaxLabel = UILabel()
    private let dayTempMinLabel = UILabel()
    //night views
    private let nightLabel = UILabel()
    private var nighttempMaxTitle = UILabel()
    private var nighttempMinTitle = UILabel()
    private let nightTempMaxLabel = UILabel()
    private let nightTempMinLabel = UILabel()
    //other views
    private let date = UILabel()
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
        contentView.addSubview(date)
        setupDayViews()
        setupNightViews()
    }
    
    private func addViewStyles() {
        date.font = UIFont.boldSystemFont(ofSize: 16)
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
        dayLabel.text = "Day"
        daytempMaxTitle.text = "Max Temp."
        daytempMinTitle.text = "Min Temp."
        contentView.addSubview(dayLabel)
        contentView.addSubview(daytempMaxTitle)
        contentView.addSubview(daytempMinTitle)
        contentView.addSubview(dayTempMaxLabel)
        contentView.addSubview(dayTempMinLabel)
    }
    
    private func setupNightViews() {
        nightLabel.text = "Night"
        nighttempMaxTitle.text = "Max Temp."
        nighttempMinTitle.text = "Min Temp."
        contentView.addSubview(nightLabel)
        contentView.addSubview(nighttempMaxTitle)
        contentView.addSubview(nighttempMinTitle)
        contentView.addSubview(nightTempMaxLabel)
        contentView.addSubview(nightTempMinLabel)
    }
    
    private func dayViewStyles() {
        dayLabel.font = UIFont.systemFont(ofSize: 18)
        daytempMaxTitle.font = UIFont.boldSystemFont(ofSize: 18)
        daytempMinTitle.font = UIFont.boldSystemFont(ofSize: 18)
        dayTempMaxLabel.font = UIFont.systemFont(ofSize: 16)
        dayTempMinLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func nightViewStyles() {
        nightLabel.font = UIFont.systemFont(ofSize: 18)
        nighttempMaxTitle.font = UIFont.boldSystemFont(ofSize: 18)
        nighttempMinTitle.font = UIFont.boldSystemFont(ofSize: 18)
        nightTempMaxLabel.font = UIFont.systemFont(ofSize: 16)
        nightTempMinLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func dayViewConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(contentView)
        }
        
        daytempMaxTitle.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin*4)
        }
        
        daytempMinTitle.snp.makeConstraints { make in
            make.top.equalTo(daytempMaxTitle.snp.bottom)
                .offset(smallMargin)
            make.left.equalTo(contentView).offset(margin*4)
        }
        
        dayTempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView).offset(-margin*4)
        }
        
        dayTempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(dayTempMaxLabel.snp.bottom)
                .offset(smallMargin)
            make.right.equalTo(contentView).offset(-margin*4)
        }
    }
    
    private func nightViewConstraints() {
        nightLabel.snp.makeConstraints { make in
            make.top.equalTo(daytempMinTitle.snp.bottom)
                .offset(smallMargin)
            make.centerX.equalTo(contentView)
        }
        
        nighttempMaxTitle.snp.makeConstraints { make in
            make.top.equalTo(nightLabel.snp.bottom).offset(smallMargin)
            make.left.equalTo(contentView).offset(margin*4)
        }
        
        nighttempMinTitle.snp.makeConstraints { make in
            make.top.equalTo(nighttempMaxTitle.snp.bottom)
                .offset(smallMargin)
            make.left.equalTo(contentView).offset(margin*4)
            make.bottom.equalTo(contentView).offset(-margin)
        }
        
        nightTempMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(nightLabel.snp.bottom).offset(smallMargin)
            make.right.equalTo(contentView).offset(-margin*4)
        }
        
        nightTempMinLabel.snp.makeConstraints { make in
            make.top.equalTo(nightTempMaxLabel.snp.bottom)
                .offset(smallMargin)
            make.right.equalTo(contentView).offset(-margin*4)
            make.bottom.equalTo(contentView).offset(-margin)
        }
    }
    
    func set(_ forecast: Forecast) {
        date.text = forecast.date
        //day binding
        dayTempMaxLabel.text = forecast.day?.tempMaxFormatted
        dayTempMinLabel.text = forecast.day?.tempMinFormatted
        //night binding
        nightTempMaxLabel.text = forecast.night?.tempMaxFormatted
        nightTempMinLabel.text = forecast.night?.tempMinFormatted
    }
    
}
