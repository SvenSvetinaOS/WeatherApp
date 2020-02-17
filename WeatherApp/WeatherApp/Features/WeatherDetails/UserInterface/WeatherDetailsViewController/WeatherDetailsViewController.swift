import UIKit
import PureLayout
import RxSwift

class WeatherDeatilsViewController: UIViewController {
    var weatherDetailsCollectionView: UICollectionView!
    var weatherDetailsPresenter: WeatherDetailsPresenter!
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
    }
    
    func setupForecast() {
        weatherDetailsPresenter.forecastData
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] data in
                self?.weatherDetailsCollectionView.reloadData()
                }, onError: { error in
                    print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func setupCollectionView() {
        weatherDetailsCollectionView.register(WeatherDetailsCell.self, forCellWithReuseIdentifier: WeatherDetailsCell.identifier)
        weatherDetailsCollectionView.delegate = self
        weatherDetailsCollectionView.dataSource = self
    }
    
}
