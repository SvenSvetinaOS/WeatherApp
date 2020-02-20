import RxSwift

protocol WeatherStoreProtocol {
    func fetchWeather() -> Observable<[Weather]>
    func fetchForecast(cityId: Int) -> Observable<[Forecast]>
    func updateWeather(weather: [Weather]) -> Completable
    func updateForecast(forecast: Forecast) -> Completable
}
