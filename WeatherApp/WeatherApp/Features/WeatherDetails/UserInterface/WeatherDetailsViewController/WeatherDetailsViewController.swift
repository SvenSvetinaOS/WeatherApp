import UIKit
import PureLayout
import RxSwift

class WeatherDeatilsViewController: UIViewController {
    var weatherDetailsCollectionView: UICollectionView!
    var weatherDetailsPresenter: WeatherDetailsPresenter!
    var forecast = [ForecastViewModel]()
    private let disposeBag = DisposeBag()
    
    convenience init (weatherDetailsPresenter: WeatherDetailsPresenter) {
        self.init()
        self.weatherDetailsPresenter = weatherDetailsPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        setupCollectionView()
        setupForecast()
        updateForecast()
    }
    
    func setupForecast() {
        weatherDetailsPresenter.forecastData
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                self?.forecast = data
                self?.weatherDetailsCollectionView.reloadData()
                },
                       onError: { error in
                        print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func updateForecast() {
        weatherDetailsPresenter.updateForecast()
    }
    
    func setupCollectionView() {
        weatherDetailsCollectionView.register(WeatherDetailsCell.self, forCellWithReuseIdentifier: WeatherDetailsCell.identifier)
        weatherDetailsCollectionView.delegate = self
        weatherDetailsCollectionView.dataSource = self
    }
    
}
