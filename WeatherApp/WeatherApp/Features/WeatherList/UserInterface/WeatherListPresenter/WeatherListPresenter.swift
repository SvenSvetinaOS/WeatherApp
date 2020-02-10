class WeatherListPresenter {
    private var weatherUseCase: WeatherUseCaseProtocol
    var currentWeather = [WeatherViewModel]()
    var fetchCompleted: (() -> ())?
    var fetchFailed: ((_ error: String) -> ())?
    
    init(weatherUseCase: WeatherUseCaseProtocol) {
        self.weatherUseCase = weatherUseCase
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
    
}
