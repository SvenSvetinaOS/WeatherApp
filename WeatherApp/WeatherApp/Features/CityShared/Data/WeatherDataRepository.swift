import RxSwift

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
    
    func fetchWeather()  -> Single<MultiCitiesWeather> {
        return currentWeatherNetworkService.fetchWeather(cityIds: ids)
    }
    
    func fetchForecast(cityId: Int)  -> Single<Forecast> {
        return forecastNetworkService.fetchForecast(cityId: cityId)
    }
    
}
