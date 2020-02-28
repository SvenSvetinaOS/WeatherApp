@testable import WeatherApp
import RxSwift

struct WeatherDataMock {
    static let currentWeather = Weather(
        id: 0,
        name: "",
        coord: Coordinates(lon: 0, lat: 0),
        weatherInfo: [WeatherInfo(
            id: 0,
            main: "",
            description: "",
            icon: "")],
        weatherLocation: WeatherLocation(
            country: "",
            sunrise: 0,
            sunset: 0),
        weatherMainInfo: WeatherMainInfo(
            temp: 0,
            tempMin: 0,
            tempMax: 0),
        wind: Wind(speed: 0, deg: 0),
        clouds: Clouds(cloudiness: 0))

    static let correctWeatherData = [currentWeather]
    
    static let correctWeatherViewModels = correctWeatherData.map { WeatherViewModel(weather: $0) }
    
    static let multiCitiesWeather = MultiCitiesWeather(
        cnt: 1,
        list: [WeatherDataMock.currentWeather])
    
    static let forecast = Forecast(
        city: City(
            id: 0,
            name: "",
            country: "",
            coord: Coordinates(lon: 0, lat: 0),
            timezone: 1),
        cnt: 1,
        list: [ForecastInfo(
            timeUTC: 0,
            time: "",
            weather: [WeatherInfo(
                id: 0,
                main: "",
                description: "",
                icon: "")],
            clouds: Clouds(cloudiness: 1), wind: Wind(speed: 0, deg: 0),
            weatherMainInfo: WeatherMainInfo(
                temp: 0,
                tempMin: 0,
                tempMax: 0)), ForecastInfo(
                    timeUTC: 1,
                    time: "",
                    weather: [WeatherInfo(
                        id: 0, main: "",
                        description: "",
                        icon: "")],
                    clouds: Clouds(cloudiness: 0),
                    wind: Wind(speed: 0, deg: 0),
                    weatherMainInfo: WeatherMainInfo(
                        temp: 0,
                        tempMin: 0,
                        tempMax: 0))])
    
    static let correctForecastData = [forecast]
    
    static let correctForecastViewModel = ForecastViewModel(
    forecast: ForecastInfo(
        timeUTC: 0,
        time: "",
        weather: [WeatherInfo(id: 1, main: "", description: "", icon: "")],
        clouds: Clouds(cloudiness: 0),
        wind: Wind(speed: 0, deg: 0),
        weatherMainInfo: WeatherMainInfo(
            temp: 0,
            tempMin: 0,
            tempMax: 0)),
    timezone: 0)
    
    static let correctForecastViewModels = [correctForecastViewModel]
}


