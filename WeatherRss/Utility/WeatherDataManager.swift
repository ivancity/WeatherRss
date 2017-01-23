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
    //var forecasts: Forecasts?
    fileprivate var forecastsArray: [Forecast]?
    fileprivate var placeArray: [Place]?
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
    
    fileprivate func handleElementData(element: xmlElements, data: String) {
        switch element {
        case .phenomenon:
            if forecastDate != nil {
                self.forecastDate?.phenomenon = data
                return
            }
            if place != nil {
                self.place?.phenomenon = data
                return
            }
        case .tempmin:
            if forecastDate != nil {
                self.forecastDate?.phenomenon = data
                return
            }
            if place != nil {
                self.place?.phenomenon = data
                return
            }
        default:
            print("handleElementData: " + data)
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
                print("ATTRIBUTE DATE " + date)
                forecast?.date = date
            }
        case .night:
            forecastDate = ForecastDate(type: .night)
        case .phenomenon:
            currentElement = .phenomenon
        case .tempmin:
            currentElement = .tempmin
        default:
            print("didStartElement: " + elementName)
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let currentElement = currentElement else {
            return
        }
        switch currentElement {
        case .phenomenon:
            handleElementData(element: .phenomenon, data: string)
        case .tempmin:
            handleElementData(element: .tempmin, data: string)
        default:
            print("foundCharacters: " + string)
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let xmlElement = xmlElements(rawValue: elementName) else {
            return
        }
        switch xmlElement {
        case .phenomenon:
            print("end phenomenon")
        case .night:
            if forecast != nil && forecastDate != nil{
                forecast?.night = forecastDate
            }
        case .forecast:
            if forecastsArray != nil && forecast != nil {
                forecastsArray?.append(forecast!)
                forecast = nil
            }
        case .forecasts:
            if forecasts != nil && forecastsArray != nil{
                forecasts?.forecasts = forecastsArray
                forecastsArray = nil
            }
        default:
            print("didEndElement: " + elementName)
        }
        
        
        
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("didEndElement")
    }
}
