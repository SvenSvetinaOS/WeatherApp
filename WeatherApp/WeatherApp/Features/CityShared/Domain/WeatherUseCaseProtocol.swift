protocol WeatherUseCaseProtocol {
    func getCurrentWeather(completion: @escaping (MultiCitiesWeather) -> Void)
    func getForecast(cityId: Int, completion: @escaping (Forecast) -> Void)
}
