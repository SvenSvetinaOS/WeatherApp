import RxSwift

protocol WeatherUseCaseProtocol {
    func getCurrentWeather() -> Single<MultiCitiesWeather>
    func getForecast(cityId: Int)  -> Single<Forecast>
    func getWeatherData() -> Observable<[Weather]>
    func getForecastData(cityId: Int) -> Observable<[Forecast]>
    func updateWeather() -> Completable
    func updateForecast(cityId: Int) -> Completable
}
