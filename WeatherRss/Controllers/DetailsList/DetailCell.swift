//
//  DetailCell.swift
//  WeatherRss
//
//  Created by MC_test on 14/02/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    private let cityName = UILabel()
    private let dayValues = UILabel()
    private let nightValues = UILabel()
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
        contentView.addSubview(cityName)
        contentView.addSubview(dayValues)
        contentView.addSubview(nightValues)
    }
    
    private func addViewStyles() {
        cityName.font = UIFont.boldSystemFont(ofSize: 18)
        dayValues.font = UIFont.systemFont(ofSize: 16)
        nightValues.font = UIFont.systemFont(ofSize: 16)
        cityName.textColor = .whiteThree
        dayValues.textColor = .white
        nightValues.textColor = .gray
    }
    
    private func addViewConstraints() {
        cityName.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(margin)
            make.centerX.equalTo(contentView)
        }
        
        dayValues.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(margin)
            make.centerX.equalTo(contentView)
        }
        
        nightValues.snp.makeConstraints { make in
            make.top.equalTo(dayValues.snp.bottom).offset(smallMargin)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-margin)
        }
    }
    
    func set(day: Place?, night: Place?) {
        var dayString = ""
        var nightString = ""
        if let max = day?.tempMax, let min = night?.tempMin {
            dayString = "Day: \(max)˚C" + " - " + (day?.phenomenon)!
            nightString = "Evening: \(min)˚C" + " - " + (night?.phenomenon)!
        }
        cityName.text = day?.name
        dayValues.text = dayString
        nightValues.text = nightString
    }
    
}

