class DependencyContainer {
    var weatherUseCase: WeatherUseCase {
        let currentWeatherNetworkService = CurrentWeatherNetworkService()
        let forecastNetworkService = ForecastNetworktService()
        let cityService = CityService()
        let coreDataStack = CoreDataStack()
        let weatherStore = WeatherStore(coreDataContext: coreDataStack.managedObjectContext)
        let weatherDataRepository = WeatherDataRepository(
            currentWeatherNetworkService: currentWeatherNetworkService,
            forecastNetworkService: forecastNetworkService,
            cityService: cityService,
            weatherStore: weatherStore)
        
        return WeatherUseCase(weatherDataRepository: weatherDataRepository)
    }
    
}
