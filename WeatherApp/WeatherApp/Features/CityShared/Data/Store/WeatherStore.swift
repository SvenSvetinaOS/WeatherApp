import CoreData
import RxSwift

class WeatherStore: WeatherStoreProtocol {
    private let coreDataContext: NSManagedObjectContext
    
    init(coreDataContext: NSManagedObjectContext) {
        self.coreDataContext = coreDataContext
    }
    
    func fetchWeather() -> Observable<[Weather]> {
        let request: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return coreDataContext
            .entities(request as! NSFetchRequest<NSFetchRequestResult>)
            .map { $0.map { $0 as! CDWeather } }
            .map { $0.map { Weather(entity: $0) } }
    }
    
    func fetchForecast(cityId: Int) -> Observable<[Forecast]> {
        let request: NSFetchRequest<CDForecast> = CDForecast.fetchRequest()
        request.predicate = NSPredicate(format: "city.id = %u", cityId)
        request.sortDescriptors = [NSSortDescriptor(key: "city", ascending: true)]
        return coreDataContext
            .entities(request as! NSFetchRequest<NSFetchRequestResult>)
            .map{ $0.map { $0 as! CDForecast} }
            .map{ $0.map {Forecast(with: $0)} }
    }
    
    func updateWeather(weather: [Weather]) -> Completable {
        let request: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        return Completable.create { [weak self] completable in
            guard let self = self else { return Disposables.create() }
            self.coreDataContext.perform {
                weather.forEach {
                    request.predicate = NSPredicate(format: "id = %u", $0.id)
                    do {
                        let response = try self.coreDataContext.fetch(request)
                        let cdWeather = response.first ?? CDWeather(context: self.coreDataContext)
                        $0.toModel(entity: cdWeather, context: self.coreDataContext)
                    } catch {
                        completable(.error(error))
                        return
                    }
                }
                do {
                    try self.coreDataContext.save()
                } catch {
                    completable(.error(error))
                    return
                }
                completable(.completed)
            }
            return Disposables.create()
        }
    }
    
    func updateForecast(forecast: Forecast) -> Completable {
        let request: NSFetchRequest<CDForecast> = CDForecast.fetchRequest()
        return Completable.create { [weak self] completable in
            guard let self = self else { return Disposables.create() }
            self.coreDataContext.perform {
                request.predicate = NSPredicate(format: "city.id = %u", forecast.city.id)
                do {
                    let response = try self.coreDataContext.fetch(request)
                    let cdForecast = response.first ?? CDForecast(context: self.coreDataContext)
                    forecast.toModel(entity: cdForecast, context: self.coreDataContext)
                } catch {
                    completable(.error(error))
                    return
                }
                do {
                    try self.coreDataContext.save()
                } catch {
                    debugPrint(error)
                    completable(.error(error))
                    return
                }
                completable(.completed)
            }
            return Disposables.create()
        }
    }
}
