struct Weather: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let weatherInfo: [WeatherInfo]
    let main: WeatherMain
    let wind: Wind
    let clouds: Clouds
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case weatherInfo = "weather"
        case main = "main"
        case wind = "winds"
        case clouds = "clouds"
    }
}
