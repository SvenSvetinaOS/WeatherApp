import UIKit
import RxSwift

class WeatherListViewController: UIViewController {
    
    var weatherListPresenter: WeatherListPresenter!
    let cellHeight: CGFloat = 200.0
    var weather = [WeatherViewModel]()
    let tableView = UITableView()
    private let disposeBag = DisposeBag()
    
    convenience init (weatherListPresenter: WeatherListPresenter) {
        self.init()
        self.weatherListPresenter = weatherListPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        setupWeather()
    }
    
    func setupWeather() {
        weatherListPresenter.weather
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] data in
                self?.weather = data
                self?.tableView.reloadData()
                },
                       onError: { error in
                        print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherInfoCell.self, forCellReuseIdentifier: WeatherInfoCell.identifier)
    }
    
    func buildViews() {
        setupTableView()
        
        view.addSubview(tableView)
        navigationItem.title = AppTexts.weatherTitle
        
        tableView.backgroundColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}



