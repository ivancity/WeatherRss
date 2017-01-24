//
//  ForecastDate.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class ForecastDate {
    var type: xmlElements
    var phenomenon: String?
    var tempMin: Int?
    var tempMax: Int?
    var windMin: Int?
    var windMax: Int?
    var tempMinFormatted: String {
        guard let tempMin = tempMin else {
            return "N/A"
        }
        return "\(tempMin)" + " ˚C"
    }
    var tempMaxFormatted: String {
        guard let tempMax = tempMax else {
            return "N/A"
        }
        return "\(tempMax)" + " ˚C"
    }
    
    var windMinFormatted: String {
        guard let windMin = windMin else {
            return "N/A"
        }
        return "\(windMin)" + " m/s"
    }
    var windMaxFormatted: String {
        guard let windMax = windMax else {
            return "N/A"
        }
        return "\(windMax)" + " m/s"
    }
    var tempMinWord: String?
    var tempMaxWord: String?
    var tempPhrase: String?
    var description: String?
    var placeArray: [Place]?
    var windArray: [Wind]? {
        didSet {
            guard let windArray = windArray else {
                windMin = nil
                windMax = nil
                return
            }
            maxMinWindValues(windArray: windArray)
        }
    }
    
    init(type: xmlElements) {
        self.type = type
    }
    
    private func maxMinWindValues(windArray: [Wind]) {
        windMin = windArray.map{ $0.speedMin! }.min()
        windMax = windArray.map{ $0.speedMax! }.max()
    }
}
