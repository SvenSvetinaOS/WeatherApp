import UIKit
import PureLayout

extension WeatherInfoCell {
    func buildViews() {
        self.backgroundColor = .lightGray
        container = UIView(forAutoLayout: ())
        addSubview(container)
        container.autoPinEdgesToSuperviewEdges()
        
        cityNameLabel = UILabel(forAutoLayout: ())
        container.addSubview(cityNameLabel)
        cityNameLabel.autoPinEdge(.top, to: .top, of: container, withOffset: 20.0)
        cityNameLabel.autoPinEdge(.leading, to: .leading, of: container, withOffset: 20.0)
        cityNameLabel.font = UIFont(name: "Helvetica", size: 28)
        cityNameLabel.autoAlignAxis(.vertical, toSameAxisOf: container)
        
        weatherIcon = UIImageView(forAutoLayout: ())
        container.addSubview(weatherIcon)
        weatherIcon.autoAlignAxis(.vertical, toSameAxisOf: container)
        weatherIcon.autoAlignAxis(.horizontal, toSameAxisOf: container)
        
        tempLabel = UILabel(forAutoLayout: ())
        tempLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        container.addSubview(tempLabel)
        tempLabel.autoPinEdge(.trailing, to: .trailing, of: container, withOffset: -32.0)
        tempLabel.autoAlignAxis(.horizontal, toSameAxisOf: weatherIcon)
        
        countryLabel = UILabel(forAutoLayout: ())
        container.addSubview(countryLabel)
        countryLabel.autoPinEdge(.top, to: .bottom, of: cityNameLabel)
        countryLabel.autoPinEdge(.leading, to: .leading, of: container, withOffset: 20.0)
        countryLabel.autoAlignAxis(.horizontal, toSameAxisOf: weatherIcon)
        
    }
}
