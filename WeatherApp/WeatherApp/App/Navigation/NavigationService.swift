import UIKit

class NavigationService: NSObject {
    private let rootNavigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
    private let dependencyContainer = DependencyContainer()
    
    func pushWeatherListViewController(window: UIWindow?) {
        let weatherListPresenter = WeatherListPresenter(weatherUseCase: dependencyContainer.weatherUseCase,
                                                        navigationService: self)
        let weatherVC = WeatherListViewController(weatherListPresenter: weatherListPresenter)
        rootNavigationController.pushViewController(weatherVC, animated: true)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
    func pushWeatherDetailsViewController(weatherViewModel: WeatherViewModel) {
        let weatherDetailsPresenter = WeatherDetailsPresenter(weatherUseCase: dependencyContainer.weatherUseCase,
                                                              weatherViewModel: weatherViewModel)
        let weatherDetailsViewController = WeatherDeatilsViewController(weatherDetailsPresenter: weatherDetailsPresenter)
        rootNavigationController.pushViewController(weatherDetailsViewController, animated: true)
    }
    
}

