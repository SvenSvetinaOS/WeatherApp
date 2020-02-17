import Foundation
import RxSwift

class CurrentWeatherNetworkService: NetworkService {
    
    func fetchWeather(cityIds ids: [Int]) -> Single<MultiCitiesWeather> {
        fetchData(route: WeatherEndPoint.current(cityIds: ids))
    }
}
