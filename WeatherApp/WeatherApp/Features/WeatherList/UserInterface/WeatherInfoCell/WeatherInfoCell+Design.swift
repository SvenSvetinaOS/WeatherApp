import UIKit
import PureLayout

extension WeatherInfoCell {
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        container = UIView(forAutoLayout: ())
        addSubview(container)
        
        cityNameLabel = UILabel(forAutoLayout: ())
        container.addSubview(cityNameLabel)
        
        weatherIcon = UIImageView(forAutoLayout: ())
        container.addSubview(weatherIcon)
        
        tempLabel = UILabel(forAutoLayout: ())
        container.addSubview(tempLabel)
        
        
        countryLabel = UILabel(forAutoLayout: ())
        container.addSubview(countryLabel)
    }
    
    func styleViews() {
        backgroundColor = .lightGray
        
        cityNameLabel.font = UIFont(name: "Helvetica", size: 28)
        tempLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    }
    
    func defineLayoutForViews() {
        container.autoPinEdgesToSuperviewEdges()
        
        cityNameLabel!.autoPinEdge(.top, to: .top, of: container, withOffset: labelOffset)
        cityNameLabel!.autoPinEdge(.leading, to: .leading, of: container, withOffset: labelOffset)
        cityNameLabel.autoAlignAxis(.vertical, toSameAxisOf: container)
        
        weatherIcon.autoAlignAxis(.vertical, toSameAxisOf: container)
        weatherIcon.autoAlignAxis(.horizontal, toSameAxisOf: container)
        
        tempLabel.autoPinEdge(.trailing, to: .trailing, of: container, withOffset: -32.0)
        tempLabel.autoAlignAxis(.horizontal, toSameAxisOf: weatherIcon)
        
        countryLabel.autoPinEdge(.top, to: .bottom, of: cityNameLabel)
        countryLabel.autoPinEdge(.leading, to: .leading, of: container, withOffset: labelOffset)
        countryLabel.autoAlignAxis(.horizontal, toSameAxisOf: weatherIcon)
        
    }
}
