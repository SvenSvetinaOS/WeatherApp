import UIKit

class NavigationService: NSObject {
    
    let rootNavigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
    
    func pushWeatherListViewController(window: UIWindow?) {
        let currentWeatherNetworkService = CurrentWeatherNetworkService()
        let weatherDataRepository =  WeatherDataRepository(currentWeatherNetworkService: currentWeatherNetworkService)
        let weatherUseCase = WeatherUseCase(weatherDataRepository: weatherDataRepository)
        let weatherListPresenter = WeatherListPresenter(weatherUseCase: weatherUseCase)
        let weatherVC = WeatherListViewController(weatherListPresenter: weatherListPresenter)
        rootNavigationController.pushViewController(weatherVC, animated: true)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
    func pushWeatherDetailsViewController() {
        //TODO: Not implemented
    }
    
}

