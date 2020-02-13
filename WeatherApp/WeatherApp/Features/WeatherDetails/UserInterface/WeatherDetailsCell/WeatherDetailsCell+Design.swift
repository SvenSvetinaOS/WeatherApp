import UIKit

extension WeatherDetailsCell {
    func buildViews() {
        createViews()
        styleViews()
        definelayoutForViews()
    }
    
    func createViews() {
        let dayOne = ForecastView(forAutoLayout: ())
        let dayTwo = ForecastView(forAutoLayout: ())
        let dayThree = ForecastView(forAutoLayout: ())
        let dayFour = ForecastView(forAutoLayout: ())
        let dayFive = ForecastView(forAutoLayout: ())
        
        container = UIView(forAutoLayout: ())
        addSubview(container)
        
        cityNameLabel = UILabel(forAutoLayout: ())
        container.addSubview(cityNameLabel)
        
        weatherIcon = UIImageView(forAutoLayout: ())
        container.addSubview(weatherIcon)
        
        tempLabel = UILabel(forAutoLayout: ())
        container.addSubview(tempLabel)
        
        stackView = UIStackView(forAutoLayout: ())
        addSubview(stackView)
        stackView.addArrangedSubview(dayOne)
        stackView.addArrangedSubview(dayTwo)
        stackView.addArrangedSubview(dayThree)
        stackView.addArrangedSubview(dayFour)
        stackView.addArrangedSubview(dayFive)
        
        tempMinLabel = UILabel(forAutoLayout: ())
        addSubview(tempMinLabel)
        
        tempMaxLabel = UILabel(forAutoLayout: ())
        addSubview(tempMaxLabel)
    }
    
    func styleViews() {
        backgroundColor = .lightGray
        
        cityNameLabel.font = UIFont(name: "Helvetica", size: 28)
        
        tempLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
    }
    
    func definelayoutForViews() {
        container.autoPinEdgesToSuperviewEdges()
        
        cityNameLabel!.autoPinEdge(.top, to: .top, of: container, withOffset: 20)
        cityNameLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        weatherIcon.autoSetDimensions(to: CGSize(width: self.frame.size.height / 3,
                                                 height: self.frame.size.height / 3))
        weatherIcon.autoPinEdge(.top, to: .bottom, of: cityNameLabel)
        weatherIcon.autoAlignAxis(toSuperviewAxis: .vertical)
        
        tempLabel.autoPinEdge(.top, to: .bottom, of: weatherIcon)
        tempLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        stackView.autoSetDimension(.height, toSize: 150)
        stackView.autoPinEdge(toSuperviewEdge: .leading)
        stackView.autoPinEdge(toSuperviewEdge: .trailing)
        stackView.autoPinEdge(.top, to: .bottom, of: tempLabel,
                              withOffset: 100)
        
        tempMinLabel.autoPinEdge(.top, to: .bottom, of: stackView, withOffset:50)
        tempMinLabel.autoPinEdge(toSuperviewEdge: .leading)
        
        tempMaxLabel.autoPinEdge(.top, to: .bottom, of: stackView, withOffset:50)
        tempMaxLabel.autoPinEdge(toSuperviewEdge: .trailing)
    }
}
