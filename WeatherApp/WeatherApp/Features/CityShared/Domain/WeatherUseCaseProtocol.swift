protocol WeatherUseCaseProtocol {
    func getCurrentWeather(completion: @escaping (MultiCitiesWeather) -> Void)
}
