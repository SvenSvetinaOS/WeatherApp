import RxSwift

class WeatherListPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    private var navigationService: NavigationService
    var currentWeather = [WeatherViewModel]()
    
    init(weatherUseCase: WeatherUseCaseProtocol, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
    func mapToViewModels(weather: [Weather]) -> [WeatherViewModel] {
        return weather.map{ WeatherViewModel(weather: $0) }
    }
    
    var weather: Single<[WeatherViewModel]> {
        return weatherUseCase.getCurrentWeather()
            .map { [weak self] weatherModel -> [WeatherViewModel] in
                guard let self = self else { return [] }
                return self.mapToViewModels(weather: weatherModel.list) }
    }
    
    func weatherCellTapped(weatherViewModel: WeatherViewModel) {
        navigationService.pushWeatherDetailsViewController(weatherViewModel: weatherViewModel)
    }
    
}
