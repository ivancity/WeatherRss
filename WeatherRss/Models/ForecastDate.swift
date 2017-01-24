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
    var description: String?
    var placeArray: [Place]?
    var windArray: [Wind]? {
        didSet {
            guard let windArray = windArray else {
                windMin = nil
                windMax = nil
                return
            }
            sortWindValues(windArray: windArray)
        }
    }
    var windMin: Int?
    var windMax: Int?
    var tempMinWord: String?
    var tempMaxWord: String?
    var tempMinFormatted: String?
    var tempMaxFormatted: String?
    var tempPhrase: String?
    
    init(type: xmlElements) {
        self.type = type
    }
    
    private func sortWindValues(windArray: [Wind]) {
        windMin = windArray.map{ $0.speedMin! }.min()
        windMax = windArray.map{ $0.speedMax! }.max()
    }
}
