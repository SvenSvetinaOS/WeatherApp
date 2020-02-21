import RxSwift

class WeatherDataRepository: WeatherDataRepositoryProtocol {
    
    private let currentWeatherNetworkService: CurrentWeatherNetworkService
    private let forecastNetworkService: ForecastNetworktService
    private let weatherStore: WeatherStore
    private let cityService: CityServiceProtocol
    private var ids = [Int]()
    
    init(currentWeatherNetworkService: CurrentWeatherNetworkService,
         forecastNetworkService: ForecastNetworktService,
         cityService: CityServiceProtocol,
         weatherStore: WeatherStore
    ) {
        self.currentWeatherNetworkService = currentWeatherNetworkService
        self.cityService = cityService
        self.ids = cityService.cities.map { $0.id }
        self.forecastNetworkService = forecastNetworkService
        self.weatherStore = weatherStore
    }
    
    func fetchWeather()  -> Single<MultiCitiesWeather> {
        return currentWeatherNetworkService.fetchWeather(cityIds: ids)
    }
    
    func fetchForecast(cityId: Int)  -> Single<Forecast> {
        return forecastNetworkService.fetchForecast(cityId: cityId)
    }
    
    func updateWeather(with weather: [Weather]) -> Completable {
        return weatherStore.updateWeather(weather: weather)
    }
    
    func updateForecast(with forecast: Forecast) -> Completable {
        return weatherStore.updateForecast(forecast: forecast)
    }
    
    func getWeatherData() -> Observable<[Weather]> {
        return weatherStore.fetchWeather()
    }
    
    func getForecastData(cityId: Int) -> Observable<[Forecast]> {
        return weatherStore.fetchForecast(cityId: cityId)
    }
    
}
