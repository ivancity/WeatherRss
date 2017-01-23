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
    var forecasts: Forecasts?
    
    init(data: Data) {
        super.init()
        xmlParser = XMLParser(data: data)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }
}

extension WeatherDataManager: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("didStartElement: " + elementName)
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("foundCharacters: " + string)
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("didEndElement: " + elementName)
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("didEndElement")
    }
}
