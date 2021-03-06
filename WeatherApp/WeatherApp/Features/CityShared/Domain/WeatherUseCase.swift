import RxSwift

class WeatherUseCase: WeatherUseCaseProtocol {
    private var weatherDataRepository: WeatherDataRepositoryProtocol!
    
    init(weatherDataRepository: WeatherDataRepositoryProtocol) {
        self.weatherDataRepository = weatherDataRepository
    }
    
    func getCurrentWeather() -> Observable<MultiCitiesWeather> {
        weatherDataRepository.fetchWeather().asObservable()
    }
    
    func getForecast(cityId: Int)  -> Observable<Forecast> {
        weatherDataRepository.fetchForecast(cityId: cityId)
    }
    
    func getWeatherData() -> Observable<[Weather]> {
        return weatherDataRepository.getWeatherData()
    }
    
    func getForecastData(cityId: Int) -> Observable<[Forecast]> {
        return weatherDataRepository.getForecastData(cityId: cityId)
    }
    
    func updateWeather() -> Completable {
        return weatherDataRepository
            .fetchWeather()
            .flatMapCompletable { [weak self] response in
                guard let self = self else { return Completable.empty() }
                return self.weatherDataRepository.updateWeather(with: response.list)
        }
    }
    
    func updateForecast(cityId: Int) -> Completable {
        return weatherDataRepository
            .fetchForecast(cityId: cityId)
            .asSingle()
            .flatMapCompletable { [weak self] response in
                guard let self = self else { return Completable.empty() }
                return self.weatherDataRepository.updateForecast(with: response)
        }
    }
    
}
