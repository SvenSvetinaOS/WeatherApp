import RxSwift
import RxCocoa
@testable import WeatherApp

class WeatherUseCaseMock: WeatherUseCaseProtocol {
    var currentWeather: PublishSubject<MultiCitiesWeather>!
    var weatherData = PublishSubject<[Weather]>()
    var forecast = PublishSubject<Forecast>()
    var forecastData: [Forecast]!
    
    func getCurrentWeather() -> Observable<MultiCitiesWeather> {
        return currentWeather.asObservable()
    }
    
    func getForecast(cityId: Int) -> Observable<Forecast> {
        return forecast.asObservable()
    }
    
    func getWeatherData() -> Observable<[Weather]> {
        return weatherData.asObservable()
    }
    
    func getForecastData(cityId: Int) -> Observable<[Forecast]> {
        return Observable.of(forecastData)
    }
    
    func updateWeather() -> Completable {
        return Completable.empty()
    }
    
    func updateForecast(cityId: Int) -> Completable {
        return Completable.empty()
    }
    
}
