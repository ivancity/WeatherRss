//
//  WeatherRssFeedService.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation

class WeatherRssFeedService {
    static func getWeatherData(completion: @escaping ((Forecasts?) -> Void)) {
        let url = "http://www.ilmateenistus.ee/ilma_andmed/xml/forecast.php"
        let requestURL = NSURL(string: url)!
        let urlRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared.dataTask(with: urlRequest as URLRequest) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error != nil {
                completion(nil)
                return
            }
            guard let incomingData = data else {
                completion(nil)
                return
            }
            let manager = WeatherDataManager(data: incomingData)
            let forecasts = manager.allForecast
            DispatchQueue.main.async {
                completion(forecasts)
            }
        }
        session.resume()
    }
}
