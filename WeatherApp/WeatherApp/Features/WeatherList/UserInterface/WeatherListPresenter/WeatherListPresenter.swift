import RxSwift

class WeatherListPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    private var navigationService: NavigationService
    var currentWeather = [WeatherViewModel]()
    
    init(weatherUseCase: WeatherUseCaseProtocol, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
    func mapToViewModels(weather: [Weather]) {
        currentWeather = weather.map({WeatherViewModel(weather: $0)})
    }
    
    var weather: Single<MultiCitiesWeather> {
        return weatherUseCase.getCurrentWeather()
            .do(onSuccess: { [weak self] data in
                self?.mapToViewModels(weather: data.list)
            })
    }
    
    func weatherCellTapped(weatherViewModel: WeatherViewModel) {
        navigationService.pushWeatherDetailsViewController(weatherViewModel: weatherViewModel)
    }
    
}
