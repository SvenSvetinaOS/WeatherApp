struct WeatherMainInfo: Codable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double

    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
