import Quick
import Nimble
import RxSwift
import RxTest
import RxNimble
@testable import WeatherApp

class WeatherDetailPresenterTests: QuickSpec {
    private var presenter: WeatherDetailsPresenter!
    private var weatherUseCase: WeatherUseCaseMock!
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    
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
            it("will contain viewModels if there is a model") {
                self.scheduler.createColdObservable([.next(50, WeatherDataMock.forecast)])
                    .bind(to: self.weatherUseCase.forecastSubject)
                    .disposed(by: self.disposeBag)
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(50,  2)]))
            }
            
            it("will contain viewModels if there are multiple models") {
                self.scheduler.createColdObservable(
                    [.next(50, WeatherDataMock.forecast),
                     .next(60, WeatherDataMock.forecast)
                ])
                    .bind(to: self.weatherUseCase.forecastSubject)
                    .disposed(by: self.disposeBag)
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(50,  2), .next(60,  2)]))
            }
            
            it("will be empty when no weather is available") {
                self.weatherUseCase.weatherDataSubject.onCompleted()
                
                let presenterData = self.presenter.forecastData.map { $0.count }
                
                let result = self.scheduler.record(presenterData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([]))
            }
        }
    }
    
}
