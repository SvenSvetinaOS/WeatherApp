import UIKit

class NavigationService: NSObject {
    
    let rootNavigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
    
    func pushWeatherListViewController(window: UIWindow?) {
        let weatherVC = WeatherListViewController()
        rootNavigationController.pushViewController(weatherVC, animated: true)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
    func pushWeatherDetailsViewController() {
        //TODO: Not implemented
    }
    
}

