//
//  City.swift
//  WeatherApp
//
//  Created by Sven Svetina on 03/02/2020.
//  Copyright © 2020 Sven Svetina. All rights reserved.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let country: String
    let coord: Coordinates
}
