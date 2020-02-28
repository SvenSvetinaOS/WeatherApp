import Quick
import Nimble
import RxSwift
import RxTest
import RxBlocking
import RxNimble
import XCTest
@testable import WeatherApp

class WeatherDetailPresenterTests: QuickSpec {
    var presenter: WeatherDetailsPresenter!
    var weatherUseCase: WeatherUseCaseMock!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func spec() {
        beforeEach {
            self.weatherUseCase = WeatherUseCaseMock()
            self.presenter = WeatherDetailsPresenter(
                weatherUseCase: self.weatherUseCase,
                weatherViewModel: WeatherDataMock.correctWeatherViewModels.first!)
            self.scheduler = TestScheduler(initialClock: 0)
            self.disposeBag = DisposeBag()
        }
        
        describe("isForecastAvailable") {
            it("returns true when mapping a single model to WeatherViewModels") {
                self.scheduler.createColdObservable([.next(50, WeatherDataMock.forecast)])
                    .bind(to: self.weatherUseCase.forecast)
                    .disposed(by: self.disposeBag)
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(50,  2)]))
            }
            
            it("returns true when mapping multiple models to WeatherViewModels") {
                self.scheduler.createColdObservable(
                    [.next(50, WeatherDataMock.forecast),
                     .next(60, WeatherDataMock.forecast)
                ])
                    .bind(to: self.weatherUseCase.forecast)
                    .disposed(by: self.disposeBag)
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(50,  2), .next(60,  2)]))
            }
            
            it("will be empty when no weather is available") {
                var forecastData = self.weatherUseCase.forecast.asObservable()
                forecastData = Observable.empty()
                
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([]))
            }
        }
    }
    
}
