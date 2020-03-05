import Foundation
import RxSwift

class WeatherDetailsPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    private let disposeBag = DisposeBag()
    var weatherViewModel: WeatherViewModel
    
    init(weatherUseCase: WeatherUseCaseProtocol, weatherViewModel: WeatherViewModel) {
        self.weatherUseCase = weatherUseCase
        self.weatherViewModel = weatherViewModel
    }
    
    var forecastData: Observable<[ForecastViewModel]> {
        return weatherUseCase
            .getForecast(cityId: weatherViewModel.id)
            .map { [weak self] forecastModel -> [ForecastViewModel] in
                guard let self = self else { return [] }
                return self.mapToViewModels(forecastData: forecastModel)
        }
    }
    
    func mapToViewModels(forecastData: Forecast) -> [ForecastViewModel] {
        return forecastData
            .list
            .sorted(by: < )
            .prefix(5)
            .map { ForecastViewModel(forecast: $0, timezone: forecastData.city.timezone) }
    }
    
    func updateForecast() {
        weatherUseCase.updateForecast(cityId: weatherViewModel.id)
            .subscribe()
            .disposed(by: disposeBag)
    }
    
}
