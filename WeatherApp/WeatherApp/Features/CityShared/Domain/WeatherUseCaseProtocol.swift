import RxSwift

protocol WeatherUseCaseProtocol {
    func getCurrentWeather() -> Single<MultiCitiesWeather>
    func getForecast(cityId: Int)  -> Single<Forecast>
}
