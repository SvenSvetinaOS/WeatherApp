import Foundation

class CurrentWeatherNetworkService: NetworkService {
    
    func fetchWeather(
        cityId id: Int,
        completion: @escaping (Weather) -> Void
    ) {
        fetchData(
            route: WeatherEndPoint.current(cityId: id),
            completion: completion
        )
    }
}
