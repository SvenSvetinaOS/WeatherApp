import RxSwift

protocol WeatherUseCaseProtocol {
    func getCurrentWeather() -> Observable<MultiCitiesWeather>
    func getForecast(cityId: Int)  -> Observable<Forecast>
    func getWeatherData() -> Observable<[Weather]>
    func getForecastData(cityId: Int) -> Observable<[Forecast]>
    func updateWeather() -> Completable
    func updateForecast(cityId: Int) -> Completable
}
