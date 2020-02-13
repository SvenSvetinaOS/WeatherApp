import Foundation

class WeatherDetailsPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    var weatherViewModel: WeatherViewModel
    var forecast = [ForecastViewModel]()
    var fetchCompleted: (() -> Void)?
    var fetchFailed: ((_ error: String) -> Void)?
    
    init(weatherUseCase: WeatherUseCase, weatherViewModel: WeatherViewModel) {
        self.weatherUseCase = weatherUseCase
        self.weatherViewModel = weatherViewModel
    }
    
    func getForecast() {
        weatherUseCase.getForecast(cityId: weatherViewModel.id, completion: { [weak self] data in
            guard let self = self else { return }
            self.mapToViewModels(forecastData: data)
        })
    }
    
    func mapToViewModels(forecastData: Forecast) {
        let sortedData = forecastData.list.sorted(by: < )
        
        forecast = sortedData.prefix(5)
            .map { ForecastViewModel(forecast: $0, timezone: forecastData.city.timezone) }
        self.fetchCompleted?()
    }
}
