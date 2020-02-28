import Quick
import Nimble
import RxSwift
import RxTest
import RxBlocking
import XCTest
@testable import WeatherApp

class WeatherListPresenterTests: QuickSpec {
    var presenter: WeatherListPresenter!
    var weatherUseCase: WeatherUseCaseMock!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func spec() {
        beforeEach {
            self.weatherUseCase = WeatherUseCaseMock()
            let navigationService = NavigationService()
            self.presenter = WeatherListPresenter(weatherUseCase: self.weatherUseCase,
                                                  navigationService: navigationService)
            self.scheduler = TestScheduler(initialClock: 0)
            self.disposeBag = DisposeBag()
        }
        
        describe("mapsToViewModels") {
            it("returns true when mapping correct weather data") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: WeatherDataMock.correctWeatherData)
                
                expect(mapsToViewModel).notTo(beEmpty())
            }
            
            it("returns true when mapping empty weather data") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: [])
                
                expect(mapsToViewModel).to(beEmpty())
            }
        }
        
        describe("isWeatherAvailable") {
            it("returns true when there is weather data") {
                self.scheduler.createColdObservable([.next(30, WeatherDataMock.correctWeatherData)])
                    .bind(to: self.weatherUseCase.weatherData)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 1)]))
                
            }
            
            it("returns true when there is no weather data") {
                self.scheduler.createColdObservable([.next(30, [] )])
                    .bind(to: self.weatherUseCase.weatherData)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 0)]))
            }
            it("returns true when there is multiple weather data") {
                self.scheduler.createColdObservable(
                    [.next(30, WeatherDataMock.correctWeatherData),
                     .next(50, WeatherDataMock.correctWeatherData)
                ])
                    .bind(to: self.weatherUseCase.weatherData)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 1), .next(50, 1)]))
            }
        }
    }
    
}

