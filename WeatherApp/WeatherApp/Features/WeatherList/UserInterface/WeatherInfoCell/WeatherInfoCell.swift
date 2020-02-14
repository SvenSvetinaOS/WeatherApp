import UIKit
import Kingfisher

class WeatherInfoCell: UITableViewCell {
    
    static let identifier = String(describing: self)
    static let bundle = Bundle(for: WeatherInfoCell.self)
    
    var cityNameLabel: UILabel!
    var tempLabel: UILabel!
    var countryLabel: UILabel!
    var weatherIcon: UIImageView!
    var container: UIView!
    let labelOffset: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WeatherInfoCell.identifier)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(from: nil)
    }
    
    func configure(from model: WeatherViewModel?) {
        if let model = model {
            cityNameLabel.text = model.city
            tempLabel.text = model.temperature
            countryLabel.text = String(model.country)
            weatherIcon.kf.setImage(with: model.iconURL)
        } else {
            cityNameLabel.text = nil
            tempLabel.text = nil
            countryLabel.text = nil
        }
        
        cityNameLabel.sizeToFit()
        tempLabel.sizeToFit()
        countryLabel.sizeToFit()
    }
}
