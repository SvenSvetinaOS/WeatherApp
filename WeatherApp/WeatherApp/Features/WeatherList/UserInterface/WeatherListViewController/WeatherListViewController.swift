import UIKit

class WeatherListViewController: UIViewController {
    
    var weatherListPresenter: WeatherListPresenter!
    private let weatherTitle = "Weather"
    let cellHeight: CGFloat = 200.0
    var weather = [WeatherViewModel]()
    let tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
    convenience init (weatherListPresenter: WeatherListPresenter) {
        self.init()
        self.weatherListPresenter = weatherListPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenterCompletions()
        buildViews()
        weatherListPresenter.getWeather()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherInfoCell.self, forCellReuseIdentifier: WeatherInfoCell.identifier)
    }
    
    func buildViews() {
        setupTableView()
        
        view.addSubview(tableView)
        navigationItem.title = weatherTitle
        
        tableView.backgroundColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
        func setupPresenterCompletions() {
            weatherListPresenter.fetchCompleted = { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            weatherListPresenter.fetchFailed = { error in
                print(error)
            }
        }
    
}



