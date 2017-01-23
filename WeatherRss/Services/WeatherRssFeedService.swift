//
//  WeatherRssFeedService.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class WeatherRssFeedService {
    static func getWeatherData() {
        let url = "http://www.ilmateenistus.ee/ilma_andmed/xml/forecast.php"
        let requestURL = NSURL(string: url)!
        let urlRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared.dataTask(with: urlRequest as URLRequest) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //TODO handle incoming data 
            if error != nil {
                //send back some nil value to the claler
                return
            }
            guard let incomingData = data else { return }
            let manager = WeatherDataManager(data: incomingData)
            
        }
        session.resume()
    }
}
