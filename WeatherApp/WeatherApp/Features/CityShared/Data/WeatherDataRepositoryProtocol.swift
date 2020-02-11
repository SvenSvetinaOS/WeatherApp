protocol WeatherDataRepositoryProtocol {
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void)
    
}
