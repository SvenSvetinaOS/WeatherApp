class WeatherDataRepository: WeatherDataRepositoryProtocol {
    
    private let currentWeatherNetworkService: CurrentWeatherNetworkService
    
    init(currentWeatherNetworkService: CurrentWeatherNetworkService) {
        self.currentWeatherNetworkService = currentWeatherNetworkService
    }
    
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void) {
        let ids = [3193935, 3191648, 3190261, 3186886, 3198259, 3188383, 3186952]
        return currentWeatherNetworkService.fetchWeather(cityIds: ids, completion: { weather in
            completion(weather)
        })
    }
    
}
