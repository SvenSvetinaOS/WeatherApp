import UIKit

class WeatherDetailsViewController: UIViewController {
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //API call test for Osijek,HR
        networkService.fetchWeather(cityId: 3193935, completion: { weather in
            print(weather)
        })
    }
    
}

