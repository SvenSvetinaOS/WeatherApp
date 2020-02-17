import RxSwift

protocol WeatherDataRepositoryProtocol {
    func fetchWeather() -> Single<MultiCitiesWeather>
    func fetchForecast(cityId: Int)  -> Single<Forecast>
}
