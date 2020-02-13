class WeatherListPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    private var navigationService: NavigationService
    var currentWeather = [WeatherViewModel]()
    var fetchCompleted: (() -> Void)?
    var fetchFailed: ((_ error: String) -> Void)?
    
    init(weatherUseCase: WeatherUseCaseProtocol, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
    func mapToViewModels(weather: [Weather]) {
        currentWeather = weather.map({WeatherViewModel(weather: $0)})
    }
    
    func getWeather(){
        weatherUseCase.getCurrentWeather(completion: { [weak self] data in
            guard let self = self else { return }
            self.mapToViewModels(weather: data.list)
            self.fetchCompleted?()
        })
    }
    
    func weatherCellTapped(weatherViewModel: WeatherViewModel) {
        navigationService.pushWeatherDetailsViewController(weatherViewModel: weatherViewModel)
    }
    
}
