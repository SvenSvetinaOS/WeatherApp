//
//  WeatherMain.swift
//  WeatherApp
//
//  Created by Sven Svetina on 03/02/2020.
//  Copyright © 2020 Sven Svetina. All rights reserved.
//

import Foundation

struct WeatherMain: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
    let pressure: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case humidity = "humidity"
        case pressure = "pressure"
    }
}
