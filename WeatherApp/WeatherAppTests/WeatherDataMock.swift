@testable import WeatherApp
import RxSwift

extension Weather {
    static var correctWeatherData: [Weather] {
        return [Weather(id: 0,
                        name: "Osijek",
                        coord: Coordinates(lon: 0, lat: 0),
                        weatherInfo: [WeatherInfo(id: 0,
                                                  main: "",
                                                  description: "",
                                                  icon: "")], weatherLocation: WeatherLocation(country: "",
                                                                                               sunrise: 0,
                                                                                               sunset: 0),
                                                              weatherMainInfo: WeatherMainInfo(temp: 0,
                                                                                               tempMin: 0,
                                                                                               tempMax: 0),
                                                              wind: Wind(speed: 0, deg: 0),
                                                              clouds: Clouds(cloudiness: 0))]
    }
    
    static var emptyWeatherData: [Weather] {
        return []
    }
    
    static var correctForecastData: [Forecast] {
        return [Forecast(city: City(id: 1,
                                    name: "Osijek",
                                    country: "",
                                    coord: Coordinates(lon: 0, lat: 0),
                                    timezone: 1),
                         cnt: 1,
                         list: [])]
    }
    
    static var emptyForecastData: [Forecast] {
        return []
    }

}

extension WeatherViewModel {
    static var correctWeatherViewModels: [WeatherViewModel] {
        return [WeatherViewModel(weather: Weather.correctWeatherData.first!)]
    }
    
    static var correctWeatherViewModel: WeatherViewModel {
        return WeatherViewModel(weather: Weather.correctWeatherData.first!)
    }
    
}

extension ForecastViewModel {
    static var correctForecastViewModel: [ForecastViewModel] {
        return [ForecastViewModel(forecast: ForecastInfo(timeUTC: 0,
                                                         time: "",
                                                         weather: [],
                                                         clouds: Clouds(cloudiness: 1),
                                                         wind: Wind(speed: 0, deg: 0),
                                                         weatherMainInfo: WeatherMainInfo(temp: 2,
                                                                                          tempMin: 2,
                                                                                          tempMax: 2)),
                                  timezone: 1)]
    }
    
}
