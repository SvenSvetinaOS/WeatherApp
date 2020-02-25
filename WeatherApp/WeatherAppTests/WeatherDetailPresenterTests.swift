import Quick
import Nimble
import RxSwift
import RxTest
import RxBlocking
import XCTest
@testable import WeatherApp

class WeatherDetailPresenterTests: QuickSpec {
    var presenter: WeatherDetailsPresenter!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var weatherUseCase: WeatherUseCaseMock!
    var weatherViewModels = [WeatherViewModel]()
    
    override func spec() {
        beforeEach {
            self.weatherUseCase = WeatherUseCaseMock()
            self.presenter = WeatherDetailsPresenter(weatherUseCase: self.weatherUseCase, weatherViewModel: WeatherViewModel.correctWeatherViewModel)
            self.scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        }
        
        describe("isForecastAvailable") {
            it("returns true when there is forecast data") {
                self.weatherUseCase.forecastData = Observable.of(Weather.correctForecastData)
                let presenterData = self.presenter.forecastData.subscribeOn(self.scheduler)
                
                do {
                    let forecastData = try presenterData.toBlocking().first()
                    let isThereForecastData = forecastData?.filter { $0.forecast.clouds.cloudiness == 2 }.count == 1
                    expect(isThereForecastData).to(beTrue())
                    
                } catch {
                    print(error)
                }
            }
            it("returns false when there is no forecast data") {
                self.weatherUseCase.forecastData = Observable.of(Weather.emptyForecastData)
                let presenterData = self.presenter.forecastData.subscribeOn(self.scheduler)
                
                do {
                    let forecastData = try presenterData.toBlocking().first()
                    let isThereForecastData = forecastData?.filter { $0.forecast.clouds.cloudiness == 1 }.count == 1
                    expect(isThereForecastData).to(beFalse())
                    
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
