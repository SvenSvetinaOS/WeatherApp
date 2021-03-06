import UIKit

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherListPresenter.weatherCellTapped(weatherViewModel: weather[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeatherListViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherInfoCell.identifier) as! WeatherInfoCell
        
        let weatherForCell = weather[indexPath.row]
        cell.configure(from: weatherForCell)
        
        return cell
    }
}
