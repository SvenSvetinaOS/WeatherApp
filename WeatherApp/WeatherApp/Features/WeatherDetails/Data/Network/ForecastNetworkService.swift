import RxSwift

class ForecastNetworktService: NetworkService {
    func fetchForecast(cityId id: Int)  -> Single<Forecast> {
        fetchData(route: ForecastEndPoint.forecast(cityId: id))
    }
}
