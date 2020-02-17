import Foundation
import RxSwift

class WeatherDetailsPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    var weatherViewModel: WeatherViewModel
    var forecast = [ForecastViewModel]()
    
    init(weatherUseCase: WeatherUseCase, weatherViewModel: WeatherViewModel) {
        self.weatherUseCase = weatherUseCase
        self.weatherViewModel = weatherViewModel
    }
    
    var forecastData: Single<Forecast> {
        return weatherUseCase.getForecast(cityId: weatherViewModel.id)
            .do(onSuccess: { [weak self] data in
                self?.mapToViewModels(forecastData: data)
            })
    }
    
    func mapToViewModels(forecastData: Forecast) {
        let sortedData = forecastData.list.sorted(by: < )
        
        forecast = sortedData.prefix(5)
            .map { ForecastViewModel(forecast: $0, timezone: forecastData.city.timezone) }
    }
}
