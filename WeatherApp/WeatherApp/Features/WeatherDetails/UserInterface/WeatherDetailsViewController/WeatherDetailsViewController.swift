import UIKit
import PureLayout

class WeatherDeatilsViewController: UIViewController {
    var weatherDetailsCollectionView: UICollectionView!
    var weatherDetailsPresenter: WeatherDetailsPresenter!
    
    convenience init (weatherDetailsPresenter: WeatherDetailsPresenter) {
        self.init()
        self.weatherDetailsPresenter = weatherDetailsPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenterCompletions()
        buildViews()
        setupCollectionView()
        weatherDetailsPresenter.getForecast()
    }
    
    func setupCollectionView() {
        weatherDetailsCollectionView.register(WeatherDetailsCell.self, forCellWithReuseIdentifier: WeatherDetailsCell.identifier)
        weatherDetailsCollectionView.delegate = self
        weatherDetailsCollectionView.dataSource = self
    }
    
    func setupPresenterCompletions() {
        weatherDetailsPresenter.fetchCompleted = { [weak self] in
            DispatchQueue.main.async {
                self?.weatherDetailsCollectionView.reloadData()
            }
        }
        weatherDetailsPresenter.fetchFailed = { error in
            print(error)
        }
    }
}
