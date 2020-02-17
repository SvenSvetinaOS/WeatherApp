import RxSwift

class WeatherUseCase: WeatherUseCaseProtocol {
    private var weatherDataRepository: WeatherDataRepositoryProtocol!
    
    init(weatherDataRepository: WeatherDataRepositoryProtocol) {
        self.weatherDataRepository = weatherDataRepository
    }
    
    func getCurrentWeather() -> Single<MultiCitiesWeather> {
        weatherDataRepository.fetchWeather()
    }
    
    func getForecast(cityId: Int)  -> Single<Forecast> {
        weatherDataRepository.fetchForecast(cityId: cityId)
    }
}
