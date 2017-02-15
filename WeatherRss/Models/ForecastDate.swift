//
//  ForecastDate.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

enum WeatherPhenomenon: String {
    case cloud = "cloud"
    case sun = "sun"
    case rain = "rain"
    case sleet = "sleet"
    case snow = "snow"
    case mist = "mist"
    case glaze = "glaze"
    case rainbow = "rainbow"
}

class ForecastDate {
    var type: xmlElements
    var phenomenon: String? {
        didSet {
            if let phenomenon = phenomenon {
                chooseWeatherIcon(phenomenon: phenomenon.lowercased())
                return
            }
            icon = nil
        }
    }
    var tempMin: Int? {
        didSet {
            guard let tempMin = tempMin else {
                tempMinWord = nil
                return
            }
            tempMinWord = NumberFormatter.localizedString(from: tempMin as NSNumber,
                                                          number: .spellOut)
        }
    }
    var tempMax: Int? {
        didSet {
            guard let tempMax = tempMax else {
                tempMaxWord = nil
                return
            }
            tempMaxWord = NumberFormatter.localizedString(from: tempMax as NSNumber,
                                                          number: .spellOut)
        }
    }
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
    private var tempPhrase: String?
    var icon: WeatherPhenomenon?
    
    init(type: xmlElements) {
        self.type = type
    }
    
    func temperatureAsPhrase() -> String{
        guard let tempMinWord = tempMinWord, let tempMaxWord = tempMaxWord else {
            tempPhrase = nil
            return "Not enough weather info."
        }
        if let tempPhrase = tempPhrase {
            return tempPhrase
        }
        tempPhrase = "As cold as " + tempMinWord + ", and as warm as " + tempMaxWord
        return tempPhrase!
    }
    
    private func maxMinWindValues(windArray: [Wind]) {
        windMin = windArray.map{ $0.speedMin! }.min()
        windMax = windArray.map{ $0.speedMax! }.max()
    }
    
    private func chooseWeatherIcon(phenomenon: String) {
        if phenomenon.contains("cloud") {
            icon = .cloud
        } else if phenomenon.contains("sun") {
            icon = .sun
        } else if phenomenon.contains("rain") {
            icon = .rain
        } else if phenomenon.contains("snow") {
            icon = .snow
        } else if phenomenon.contains("sleet") {
            icon = .sleet
        } else if phenomenon.contains("glaze") {
            icon = .glaze
        } else if phenomenon.contains("mist") {
            icon = .mist
        } else {
            icon = .rainbow
        }
    }
    
}
