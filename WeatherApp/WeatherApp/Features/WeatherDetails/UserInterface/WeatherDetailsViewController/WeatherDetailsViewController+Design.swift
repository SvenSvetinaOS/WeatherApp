import UIKit

extension WeatherDeatilsViewController {
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        weatherDetailsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(weatherDetailsCollectionView)
    }
    
    func styleViews() {
        weatherDetailsCollectionView.backgroundColor = .white
        
    }
    
    func defineLayoutForViews() {
        weatherDetailsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        weatherDetailsCollectionView.autoPinEdge(toSuperviewEdge: .top)
        weatherDetailsCollectionView.autoPinEdge(toSuperviewEdge: .bottom)
        weatherDetailsCollectionView.autoPinEdge(toSuperviewEdge: .leading)
        weatherDetailsCollectionView.autoPinEdge(toSuperviewEdge: .trailing)
    }
    
}
