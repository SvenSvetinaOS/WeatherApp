import UIKit

class WeatherDetailsCell: UICollectionViewCell {
    static let identifier = String(describing: self)
    
    var cityNameLabel: UILabel!
    var tempLabel: UILabel!
    var tempMinLabel: UILabel!
    var tempMaxLabel: UILabel!
    var weatherIcon: UIImageView!
    var container: UIView!
    var stackView: UIStackView!
    let labelOffset: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }
    
    func configureWeather(from model: WeatherViewModel?) {
        if let model = model {
            cityNameLabel.text = model.city
            tempLabel.text = model.temperature
            tempMinLabel.text = "Min Temp: \(Int(round(model.weather.weatherMainInfo.tempMin)))°"
            tempMaxLabel.text = "Max Temp: \(Int(round(model.weather.weatherMainInfo.tempMax)))°"
            weatherIcon.kf.setImage(with: model.iconURL)
        } else {
            cityNameLabel.text = nil
            tempLabel.text = nil
        }
        
        cityNameLabel.sizeToFit()
        tempLabel.sizeToFit()
    }
    
    func configureForecast(forecast: [ForecastViewModel]) {
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            guard let view = view as? ForecastView else { return }
            view.configureForecastView(forecast[safeIndex: index])
        }
    }
    
}
