import RxSwift

class WeatherListPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    private var navigationService: NavigationService
    var currentWeather = [WeatherViewModel]()
    private var disposeBag = DisposeBag()
    
    init(weatherUseCase: WeatherUseCaseProtocol, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
    func mapToViewModels(weather: [Weather]) -> [WeatherViewModel] {
        return weather.map{ WeatherViewModel(weather: $0) }
    }
    
    var weather: Observable<[WeatherViewModel]> {
        return weatherUseCase.getWeatherData()
            .map { [weak self] weatherModel -> [WeatherViewModel] in
                guard let self = self else { return [] }
                return self.mapToViewModels(weather: weatherModel) }
    }
    
    func weatherCellTapped(weatherViewModel: WeatherViewModel) {
        navigationService.pushWeatherDetailsViewController(weatherViewModel: weatherViewModel)
    }
    
    func updateWeather() {
        weatherUseCase.updateWeather()
            .subscribe()
            .disposed(by: disposeBag)
    }
    
}
