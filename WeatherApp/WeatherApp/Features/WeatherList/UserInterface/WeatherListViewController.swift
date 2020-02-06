import UIKit

class WeatherDetailsViewController: UIViewController {
    
    private let currentWeatherNetworkService = CurrentWeatherNetworkService()
    private let cellHeight: CGFloat = 200.0
    private var weather = [Weather]()
    private let weatherTitle = "Weather"
    
    let tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        populateCities()
    }
    
    func populateCities() {
        let cityIds = [3193935, 3191648, 3190261]
        
        currentWeatherNetworkService.fetchWeather(
            cityIds: cityIds,
            completion: { [weak self] data in
                self?.weather = data.list
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
        })
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: WeatherInfoCell.identifier, bundle: nil), forCellReuseIdentifier: WeatherInfoCell.identifier)
    }
    
    func buildViews() {
        setupTableView()
        
        view.addSubview(tableView)
        navigationItem.title = weatherTitle
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

extension WeatherDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeatherDetailsViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherInfoCell.identifier) as! WeatherInfoCell
        let weatherforCell = weather[indexPath.row]
        
        cell.configure(model: weatherforCell)
        return cell
    }
    
}
