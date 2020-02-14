struct Forecast: Codable {
    let city: City
    let cnt: Int
    let list: [ForecastInfo]
}
