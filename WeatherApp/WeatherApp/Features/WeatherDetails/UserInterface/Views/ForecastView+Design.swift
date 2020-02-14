import UIKit

extension ForecastView {
    func buildViews() {
        createViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        weatherIcon = UIImageView(forAutoLayout: ())
        temperatureLabel = UILabel(forAutoLayout: ())
        dayLabel = UILabel(forAutoLayout: ())
        addSubview(dayLabel)
        addSubview(weatherIcon)
        addSubview(temperatureLabel)
    }

    func defineLayoutForViews() {
        dayLabel.autoPinEdge(toSuperviewEdge: .top)
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        weatherIcon.autoAlignAxis(toSuperviewAxis: .vertical)
        weatherIcon.autoPinEdge(.top, to: .bottom, of: dayLabel)
        
        temperatureLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        temperatureLabel.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 2)
    }
}
