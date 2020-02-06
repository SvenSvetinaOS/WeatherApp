import UIKit

class WeatherInfoCell: UITableViewCell {
    
    static let identifier = String(describing: WeatherInfoCell.self)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    func configure(model: Weather) {
        nameLabel.text = model.name
        tempLabel.text = "\(model.weatherMainInfo.temp)F"
        countryLabel.text = "\(model.weatherLocation.country)"
        
        nameLabel.sizeToFit()
        tempLabel.sizeToFit()
        countryLabel.sizeToFit()
    }
}
