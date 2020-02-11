class WeatherDataRepository: WeatherDataRepositoryProtocol {
    
    private let currentWeatherNetworkService: CurrentWeatherNetworkService
    private let cityService: CityServiceProtocol
    private var ids = [Int]()
    
    init(currentWeatherNetworkService: CurrentWeatherNetworkService, cityService: CityService) {
        self.currentWeatherNetworkService = currentWeatherNetworkService
        self.cityService = cityService
        getCities()
    }
    
    func getCities() {
        let cities = cityService.cities
        ids = cities.map {$0.id}
    }
    
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void) {
        return currentWeatherNetworkService.fetchWeather(cityIds: ids, completion: { weather in
            completion(weather)
        })
    }
    
}
