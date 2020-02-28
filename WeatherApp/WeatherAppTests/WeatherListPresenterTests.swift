import Quick
import Nimble
import RxSwift
import RxTest
@testable import WeatherApp

class WeatherListPresenterTests: QuickSpec {
    private var presenter: WeatherListPresenter!
    private var weatherUseCase: WeatherUseCaseMock!
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    
    override func spec() {
        beforeEach {
            self.weatherUseCase = WeatherUseCaseMock()
            let navigationService = NavigationService()
            self.presenter = WeatherListPresenter(
                weatherUseCase: self.weatherUseCase,
                navigationService: navigationService)
            self.scheduler = TestScheduler(initialClock: 0)
            self.disposeBag = DisposeBag()
        }
        
        describe("mapsToViewModels") {
            it("will contain viewModels if there are correct models") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: WeatherDataMock.correctWeatherData)
                
                expect(mapsToViewModel).notTo(beEmpty())
            }
            
            it("will not contain any viewModels if there are no models") {
                let mapsToViewModel = self.presenter.mapToViewModels(weather: [])
                
                expect(mapsToViewModel).to(beEmpty())
            }
        }
        
        describe("isWeatherAvailable") {
            it("will contain weatherData if there is a correct model") {
                self.scheduler.createColdObservable([.next(30, WeatherDataMock.correctWeatherData)])
                    .bind(to: self.weatherUseCase.weatherDataSubject)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 1)]))
                
            }
            
            it("will contain no weatherData if there are no correct models") {
                self.scheduler.createColdObservable([.next(30, [] )])
                    .bind(to: self.weatherUseCase.weatherDataSubject)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 0)]))
            }
            it("will contain weatherData if there are multiple correct models") {
                self.scheduler.createColdObservable(
                    [.next(30, WeatherDataMock.correctWeatherData),
                     .next(50, WeatherDataMock.correctWeatherData)
                ])
                    .bind(to: self.weatherUseCase.weatherDataSubject)
                    .disposed(by: self.disposeBag)
                
                let weatherData = self.presenter.weather.map { $0.count }
                
                let result = self.scheduler.record(weatherData, disposeBag: self.disposeBag)
                
                self.scheduler.start()
                
                expect(result.events).to(equal([.next(30, 1), .next(50, 1)]))
            }
        }
    }
    
}

