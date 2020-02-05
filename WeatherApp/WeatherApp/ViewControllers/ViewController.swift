import UIKit

class ViewController: UIViewController {
    var networkService: NetworkService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //API call test for Osijek,HR
        NetworkService.shared.fetchWeather(cityId: 3193935, completion: { weather in
            print(weather)
        })
    }
    
}

