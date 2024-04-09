//
//  weatherData.swift
//  Clima
//
//  Created by Tyler James on 2/16/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather: Decodable {
    let description: String
}
