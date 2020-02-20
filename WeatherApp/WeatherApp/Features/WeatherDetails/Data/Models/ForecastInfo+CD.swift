import CoreData

extension ForecastInfo {
    init(with entity: CDForecastInfo) {
        timeUTC = entity.timeUTC
        time = entity.time
        weather = entity.weatherInfo.map { WeatherInfo(with: $0) }
        clouds = Clouds(with: entity.clouds)
        wind = Wind(with: entity.wind)
        weatherMainInfo = WeatherMainInfo(with: entity.weatherMainInfo)
    }
    
    func toModel(entity: CDForecastInfo, context: NSManagedObjectContext) {
        entity.time = time
        entity.timeUTC = timeUTC
        
        entity.weatherInfo.forEach {
            context.delete($0)
        }
        weather.forEach {
            let cdWeatherDescription = CDWeatherInfo(context: context)
            $0.toModel(entity: cdWeatherDescription)
            entity.addToWeatherInfo(cdWeatherDescription)
        }
        if !entity.weatherMainInfo.isKind(of: CDWeatherMainInfo.self) {
            entity.weatherMainInfo = CDWeatherMainInfo(context: context)
        }
        weatherMainInfo.toModel(entity: entity.weatherMainInfo)
        
        if !entity.wind.isKind(of: CDWind.self) {
            entity.wind = CDWind(context: context)
        }
        wind.toModel(entity: entity.wind)
        
        if !entity.clouds.isKind(of: CDClouds.self) {
            entity.clouds = CDClouds(context: context)
        }
        clouds.toModel(entity: entity.clouds)
    }
}
