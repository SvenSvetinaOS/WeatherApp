import RxSwift

class ForecastNetworktService: NetworkService {
    func fetchForecast(cityId id: Int)  -> Observable<Forecast> {
        fetchData(route: ForecastEndPoint.forecast(cityId: id)).asObservable()
    }
}
