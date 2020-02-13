class WeatherDataRepository: WeatherDataRepositoryProtocol {
    
    private let currentWeatherNetworkService: CurrentWeatherNetworkService
    private let forecastNetworkService: ForecastNetworktService
    private let cityService: CityServiceProtocol
    private var ids = [Int]()
    
    init(currentWeatherNetworkService: CurrentWeatherNetworkService,
         forecastNetworkService: ForecastNetworktService,
         cityService: CityServiceProtocol
    ) {
        self.currentWeatherNetworkService = currentWeatherNetworkService
        self.cityService = cityService
        self.ids = cityService.cities.map { $0.id }
        self.forecastNetworkService = forecastNetworkService
    }
    
    func fetchWeather(completion: @escaping (MultiCitiesWeather) -> Void) {
        return currentWeatherNetworkService.fetchWeather(cityIds: ids, completion: { weather in
            completion(weather)
        })
    }
    
    func fetchForecast(cityId: Int, completion: @escaping (Forecast) -> Void) {
        return forecastNetworkService.fetchForecast(cityId: cityId, completion: completion)
    }
    
}
