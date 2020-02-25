import RxSwift
@testable import WeatherApp

class WeatherUseCaseMock: WeatherUseCaseProtocol {
    private var weatherRepository: WeatherDataRepositoryProtocol!
    
    var weatherData: Observable<[Weather]>!
    
    var emptyWeather: Observable<[Weather]> {
        return Observable.just([])
    }
    
    var forecastData: Observable<[Forecast]>!
    
    var emptyForecastData: Observable<[Forecast]> {
        return Observable.just([])
    }
    
    func getCurrentWeather() -> Single<MultiCitiesWeather> {
        let weatherData = MultiCitiesWeather(cnt: 1, list: [Weather(id: 1,
                                                                    name: "Osijek",
                                                                    coord: Coordinates(lon: 14, lat: 22),
                                                                    weatherInfo: [WeatherInfo(id: 2,
                                                                                              main: "Main",
                                                                                              description: "Descr",
                                                                                              icon: "icon")],
                                                                    weatherLocation: WeatherLocation(country: "HR",
                                                                                                     sunrise: 12,
                                                                                                     sunset: 33),
                                                                    weatherMainInfo: WeatherMainInfo(temp: 32,
                                                                                                     tempMin: 12,
                                                                                                     tempMax: 33),
                                                                    wind: Wind(speed: 22, deg: 23),
                                                                    clouds: Clouds(cloudiness: 2)
            )])
        return Single.just(weatherData)
    }
    
    func getForecast(cityId: Int) -> Single<Forecast> {
        return Single.just(Forecast(city: City(id: 1,
                                               name: "Osijek",
                                               country: "",
                                               coord: Coordinates(lon: 0, lat: 0),
                                               timezone: 2.0),
                                    cnt: 1,
                                    list: [ForecastInfo(timeUTC: 2,
                                                        time: "15",
                                                        weather: [WeatherInfo(id: 1,
                                                                              main: "",
                                                                              description: "",
                                                                              icon: "")],
                                                        clouds: Clouds(cloudiness: 2),
                                                        wind: Wind(speed: 15, deg: 32.0),
                                                        weatherMainInfo: WeatherMainInfo(temp: 30,
                                                                                         tempMin: 12,
                                                                                         tempMax: 33)
                                        )]))
    }
    
    func getWeatherData() -> Observable<[Weather]> {
        return weatherData
    }
    
    func getForecastData(cityId: Int) -> Observable<[Forecast]> {
        return Observable.empty()
    }
    
    func updateWeather() -> Completable {
        return Completable.empty()
    }
    
    func updateForecast(cityId: Int) -> Completable {
        return Completable.empty()
    }
    
}
