class WeatherDataRepository: WeatherDataRepositoryProtocol {
    
    private let currentWeatherNetworkService: CurrentWeatherNetworkService
    private let cityService: CityServiceProtocol
    private var ids = [Int]()
    
    init(currentWeatherNetworkService: CurrentWeatherNetworkService, cityService: CityServiceProtocol) {
        self.currentWeatherNetworkService = currentWeatherNetworkService
        self.cityService = cityService
        self.ids = cityService.cities.map { $0.id }
    }
    
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void) {
        return currentWeatherNetworkService.fetchWeather(cityIds: ids, completion: { weather in
            completion(weather)
        })
    }
    
}
