//
//  WeatherDataManager.swift
//  WeatherRss
//
//  Created by MC_test on 23/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

enum xmlElements: String {
    case forecasts = "forecasts"
    case forecast = "forecast"
    case night = "night"
    case day = "day"
    case phenomenon = "phenomenon"
    case tempmin = "tempmin"
    case tempmax = "tempmax"
    case text = "text"
    case place = "place"
    case name = "name"
    case direction = "direction"
    case speedmin = "speedmin"
    case speedmax = "speedmax"
    case wind = "wind"
    
}

class WeatherDataManager: NSObject {
    
    private var xmlParser: XMLParser?
    fileprivate var forecastsArray: [Forecast]?
    fileprivate var placeArray: [Place]?
    fileprivate var windArray: [Wind]?
    fileprivate var forecast: Forecast?
    fileprivate var forecasts: Forecasts?
    fileprivate var forecastDate: ForecastDate?
    fileprivate var place: Place?
    fileprivate var wind: Wind?
    fileprivate var currentElement: xmlElements?
    
    init(data: Data) {
        super.init()
        xmlParser = XMLParser(data: data)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }
    
    fileprivate func handle(element: xmlElements, data: String) {
        switch element {
        case .phenomenon:
            if place == nil {
                self.forecastDate?.phenomenon = data
                return
            }
            self.place?.phenomenon = data
        case .tempmin:
            guard let temp = Int(data) else {
                return
            }
            if place == nil {
                self.forecastDate?.tempMin = temp
                return
            }
            self.place?.tempMin = temp
        case .tempmax:
            guard let temp = Int(data) else {
                return
            }
            if place == nil {
                self.forecastDate?.tempMax = temp
                return
            }
            self.place?.tempMax = temp
        case .text:
            forecastDate?.description = data
        case .name:
            place?.name = data
            wind?.name = data
        case .speedmin:
            guard let speed = Int(data) else {
                return
            }
            wind?.speedMin = speed
        case .speedmax:
            guard let speed = Int(data) else {
                return
            }
            wind?.speedMax = speed
        case .direction:
            wind?.direction = data
        default:
            print("handleElementData missing: " + data)
        }
    }
}

extension WeatherDataManager: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        guard let xmlElement = xmlElements(rawValue: elementName) else {
            return
        }
        switch xmlElement {
        case .forecasts:
            forecastsArray = []
            forecasts = Forecasts()
        case .forecast:
            forecast = Forecast()
            if let date = attributeDict["date"] {
                forecast?.date = date
            }
        case .night:
            forecastDate = ForecastDate(type: .night)
            placeArray = []
            windArray = []
        case .day:
            forecastDate = ForecastDate(type: .day)
            placeArray = []
            windArray = []
        case .place:
            place = Place()
        case .wind:
            wind = Wind()
        case .phenomenon:
            currentElement = .phenomenon
        case .tempmin:
            currentElement = .tempmin
        case .tempmax:
            currentElement = .tempmax
        case .text:
            currentElement = .text
        case .name:
            currentElement = .name
        case .speedmin:
            currentElement = .speedmin
        case .speedmax:
            currentElement = .speedmax
        case .direction:
            currentElement = .direction
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let currentElement = currentElement else {
            return
        }
        guard !string.isEmpty && !string.contains("\n") else {
            return
        }
        switch currentElement {
        case .phenomenon:
            handle(element: .phenomenon, data: string)
        case .tempmin:
            handle(element: .tempmin, data: string)
        case .tempmax:
            handle(element: .tempmax, data: string)
        case .text:
            handle(element: .text, data: string)
        case .name:
            handle(element: .name, data: string)
        case .speedmin:
            handle(element: .speedmin, data: string)
        case .speedmax:
            handle(element: .speedmax, data: string)
        case .direction:
            handle(element: .direction, data: string)
        default:
            print("foundCharacters not handled: " + string)
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let xmlElement = xmlElements(rawValue: elementName) else {
            return
        }
        switch xmlElement {
        case .place:
            if let place = place {
                placeArray?.append(place)
            }
            place = nil
        case .wind:
            if let wind = wind {
                windArray?.append(wind)
            }
            wind = nil
        case .night:
            forecastDate?.placeArray = placeArray
            forecastDate?.windArray = windArray
            forecast?.night = forecastDate
            placeArray = nil
            windArray = nil
            forecastDate = nil
        case .day:
            forecastDate?.placeArray = placeArray
            forecastDate?.windArray = windArray
            forecast?.day = forecastDate
            forecastDate = nil
            placeArray = nil
            windArray = nil
        case .forecast:
            if let forecast = forecast {
                forecastsArray?.append(forecast)
            }
            forecast = nil
        case .forecasts:
            forecasts?.forecasts = forecastsArray
            forecastsArray = nil
        default:
            return
        }
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("didEndElement")
    }
}
