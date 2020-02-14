import UIKit
import Kingfisher

class ForecastView: UIView {
    var weatherIcon: UIImageView!
    var temperatureLabel: UILabel!
    var dayLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }
    
    func configureForecastView(_ model: ForecastViewModel?) {
        if let model = model {
            temperatureLabel.text = "\(Int(round(model.temp)))°"
            dayLabel.text = model.day
            weatherIcon.kf.setImage(with: model.iconURL)
        } else {
            temperatureLabel.text = "error"
            dayLabel.text = "error"
            weatherIcon.image = nil
        }
    }
    
}
