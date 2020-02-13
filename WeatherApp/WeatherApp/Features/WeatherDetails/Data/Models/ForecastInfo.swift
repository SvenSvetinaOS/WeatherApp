struct ForecastInfo: Codable {
    let timeUTC: Double
    let time: String
    let weather: [WeatherInfo]
    let clouds: Clouds
    let wind: Wind
    let weatherMainInfo: WeatherMainInfo
    
    enum CodingKeys: String, CodingKey {
        case timeUTC = "dt"
        case time = "dt_txt"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case weatherMainInfo = "main"
    }
}
    
    extension ForecastInfo: Equatable, Comparable {
        static func < (lhs: ForecastInfo, rhs: ForecastInfo) -> Bool {
            return lhs.time < rhs.time
        }
        
        static func == (lhs: ForecastInfo, rhs: ForecastInfo) -> Bool {
            return lhs.timeUTC == rhs.timeUTC
        }
    
}

