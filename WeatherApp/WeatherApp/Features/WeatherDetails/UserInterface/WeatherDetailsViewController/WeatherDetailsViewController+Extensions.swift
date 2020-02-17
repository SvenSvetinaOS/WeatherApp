import UIKit

extension WeatherDeatilsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension WeatherDeatilsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailsCell.identifier, for: indexPath) as! WeatherDetailsCell
        cell.configureWeather(from: weatherDetailsPresenter.weatherViewModel)
        cell.configureForecast(forecast: forecast)
        
        return cell
    }
}

extension WeatherDeatilsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}


