import CoreData

extension Forecast {
    init(with entity: CDForecast) {
        city = City(with: entity.city)
        cnt = Int(entity.cnt)
        list = entity.forecastInfo.map { ForecastInfo(with: $0) }
    }
    func toModel(entity: CDForecast, context: NSManagedObjectContext) {
        entity.cnt = Int32(cnt)
        
        entity.forecastInfo.forEach {
            context.delete($0)
        }
        list.forEach {
            let cdForecast = CDForecastInfo(context: context)
            $0.toModel(entity: cdForecast, context: context)
            entity.addToForecastInfo(cdForecast)
        }
        
        if !entity.city.isKind(of: CDCity.self) {
            entity.city = CDCity(context: context)
        }
        city.toModel(entity: entity.city, context: context)
    }
}
