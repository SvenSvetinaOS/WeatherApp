struct Weather: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let weather: [WeatherInfo]
    let main: WeatherMain
    let wind: Wind
    let clouds: Clouds
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coord = "coord"
        case weather = "weather"
        case main = "main"
        case wind = "wind"
        case clouds = "clouds"
    }
}
