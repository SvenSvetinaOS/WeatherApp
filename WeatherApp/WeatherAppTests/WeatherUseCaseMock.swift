import RxSwift
import RxCocoa
@testable import WeatherApp

class WeatherUseCaseMock: WeatherUseCaseProtocol {
    var currentWeatherSubject: PublishSubject<MultiCitiesWeather>!
    var weatherDataSubject = PublishSubject<[Weather]>()
    var forecastSubject = PublishSubject<Forecast>()
    var forecastData: [Forecast]!
    
    func getCurrentWeather() -> Observable<MultiCitiesWeather> {
        return currentWeatherSubject.asObservable()
    }
    
    func getForecast(cityId: Int) -> Observable<Forecast> {
        return forecastSubject.asObservable()
    }
    
    func getWeatherData() -> Observable<[Weather]> {
        return weatherDataSubject.asObservable()
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
