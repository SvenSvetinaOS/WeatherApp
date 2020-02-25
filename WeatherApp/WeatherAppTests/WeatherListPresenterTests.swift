import Quick
import Nimble
import RxSwift
import RxTest
import RxBlocking
import XCTest
@testable import WeatherApp

class WeatherListPresenterTests: QuickSpec {
    var presenter: WeatherListPresenter!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var weatherUseCase: WeatherUseCaseMock!
    var weatherViewModels = [WeatherViewModel]()
    
    override func spec() {
        beforeEach {
            self.weatherUseCase = WeatherUseCaseMock()
            let navigationService = NavigationService()
            self.presenter = WeatherListPresenter(weatherUseCase: self.weatherUseCase,
                                                  navigationService: navigationService)
            self.scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        }
        
        describe("mapsToViewModels") {
            it("returns true when mapping correct weather data") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: Weather.correctWeatherData)
                
                expect(mapsToViewModel).notTo(beEmpty())
            }
            
            it("returns true when mapping empty weather data") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: Weather.emptyWeatherData)
                
                expect(mapsToViewModel).to(beEmpty())
            }
        }
        
        describe("isWeatherAvailable") {
            it("returns true when there is weather data") {
                self.weatherUseCase.weatherData = Observable.of(Weather.correctWeatherData)
                let presenterData = self.presenter.weather.subscribeOn(self.scheduler)
                
                do {
                    let weatherData = try presenterData.toBlocking().first()
                    let thereIsWeatherData = weatherData?.filter { $0.city.contains("Osijek") }.count == 1
                    
                    expect(thereIsWeatherData).to(beTrue())
                } catch {
                    print(error)
                }
            }
            
            it("returns false when there is no weather data") {
                self.weatherUseCase.weatherData = Observable.of([])
                let presenterData = self.presenter.weather.subscribeOn(self.scheduler)
                
                do {
                    let weatherData = try presenterData.toBlocking().first()
                    let thereIsNoWeatherData = weatherData?.filter { $0.city.contains("Osijek") }.count == 1
                    
                    expect(thereIsNoWeatherData).to(beFalse())
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

