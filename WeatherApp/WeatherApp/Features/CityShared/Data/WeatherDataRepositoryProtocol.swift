protocol WeatherDataRepositoryProtocol {
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void)
    func fetchForecast(cityId: Int, completion: @escaping (Forecast) -> Void)
}
