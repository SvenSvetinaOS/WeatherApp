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
