import RxSwift

protocol WeatherDataRepositoryProtocol {
    func fetchWeather() -> Single<MultiCitiesWeather>
    func fetchForecast(cityId: Int)  -> Single<Forecast>
    func updateWeather(with weather: [Weather]) -> Completable
    func updateForecast(with forecast: Forecast) -> Completable
    func getWeatherData() -> Observable<[Weather]>
    func getForecastData(cityId: Int) -> Observable<[Forecast]>
}
