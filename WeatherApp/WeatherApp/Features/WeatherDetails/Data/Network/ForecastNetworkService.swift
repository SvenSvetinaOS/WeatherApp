class ForecastNetworktService: NetworkService {
    func fetchForecast(cityId id: Int, completion: @escaping (Forecast) -> Void) {
        fetchData(route: ForecastEndPoint.forecast(cityId: id), completion: completion)
    }
}
