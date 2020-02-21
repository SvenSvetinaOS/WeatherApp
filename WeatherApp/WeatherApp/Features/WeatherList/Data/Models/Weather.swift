struct Weather: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let weatherInfo: [WeatherInfo]
    let weatherLocation: WeatherLocation
    let weatherMainInfo: WeatherMainInfo
    let wind: Wind
    let clouds: Clouds
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case weatherInfo = "weather"
        case weatherLocation = "sys"
        case weatherMainInfo = "main"
        case wind = "wind"
        case clouds = "clouds"
    }
}
