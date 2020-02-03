//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Sven Svetina on 03/02/2020.
//  Copyright © 2020 Sven Svetina. All rights reserved.
//

import Foundation

struct WeatherInfo: Codable {
    let id: Int
    let main: String
    let descriptor: String
    let icon: String
}
