class WeatherUseCase: WeatherUseCaseProtocol {
    private var weatherDataRepository: WeatherDataRepositoryProtocol!
    
    init(weatherDataRepository: WeatherDataRepositoryProtocol) {
        self.weatherDataRepository = weatherDataRepository
    }
    
    func getCurrentWeather(completion: @escaping (MultiCitiesWeather) -> Void) {
        weatherDataRepository.fetchWeather(completion: completion)
    }
}
