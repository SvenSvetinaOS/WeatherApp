import UIKit

class NavigationService: NSObject {
    
    let rootNavigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
    
    func pushWeatherListViewController(window: UIWindow?) {
        let currentWeatherNetworkService = CurrentWeatherNetworkService()
        let forecastNetworkService = ForecastNetworktService()
        let cityService: CityServiceProtocol = CityService()
        let weatherDataRepository =  WeatherDataRepository(
            currentWeatherNetworkService: currentWeatherNetworkService,
            forecastNetworkService: forecastNetworkService,
            cityService: cityService)
        let weatherUseCase = WeatherUseCase(weatherDataRepository: weatherDataRepository)
        let weatherListPresenter = WeatherListPresenter(weatherUseCase: weatherUseCase, navigationService: self)
        let weatherVC = WeatherListViewController(weatherListPresenter: weatherListPresenter)
        rootNavigationController.pushViewController(weatherVC, animated: true)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
    func pushWeatherDetailsViewController(weatherViewModel: WeatherViewModel) {
        let currentWeatherNetworkService = CurrentWeatherNetworkService()
        let forecastNetworkService = ForecastNetworktService()
        let cityService: CityServiceProtocol = CityService()
        let weatherDataRepository =  WeatherDataRepository(currentWeatherNetworkService: currentWeatherNetworkService,
                                                           forecastNetworkService: forecastNetworkService,
                                                           cityService: cityService)
        let weatherUseCase = WeatherUseCase(weatherDataRepository: weatherDataRepository)
        let weatherDetailsPresenter = WeatherDetailsPresenter(weatherUseCase: weatherUseCase, weatherViewModel: weatherViewModel)
        let weatherDetailsVC = WeatherDeatilsViewController(weatherDetailsPresenter: weatherDetailsPresenter)
        rootNavigationController.pushViewController(weatherDetailsVC, animated: true)
    }
    
}

