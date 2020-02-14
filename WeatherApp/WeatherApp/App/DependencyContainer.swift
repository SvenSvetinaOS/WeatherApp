class DependencyContainer {
    var weatherUseCase: WeatherUseCase!
    
    init() {
        self.weatherUseCase = createdUseCase
    }
    
    var createdUseCase: WeatherUseCase {
        let currentWeatherNetworkService = CurrentWeatherNetworkService()
        let forecastNetworkService = ForecastNetworktService()
        let cityService = CityService()
        let weatherDataRepository = WeatherDataRepository(
            currentWeatherNetworkService: currentWeatherNetworkService,
            forecastNetworkService: forecastNetworkService, cityService: cityService)
        
        return WeatherUseCase(weatherDataRepository: weatherDataRepository)
    }
    
}
