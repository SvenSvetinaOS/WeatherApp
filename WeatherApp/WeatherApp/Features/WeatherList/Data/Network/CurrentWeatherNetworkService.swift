import Foundation

class CurrentWeatherNetworkService: NetworkService {
    
    func fetchWeather(
        cityIds ids: [Int],
        completion: @escaping (MultiCitiesWeather) -> Void
    ) {
        fetchData(
            route: WeatherEndPoint.current(cityIds: ids),
            completion: completion
        )
    }
}
