import CoreData

extension Weather {
    init(entity: CDWeather) {
        id = Int(entity.id)
        name = entity.name
        clouds = Clouds(with: entity.clouds)
        wind = Wind(with: entity.wind)
        weatherMainInfo = WeatherMainInfo(with: entity.weatherMainInfo)
        weatherLocation = WeatherLocation(with: entity.weatherLocation)
        weatherInfo = entity.weatherInfo.map { WeatherInfo(with: $0) }
        coord = Coordinates(with: entity.coord)
    }
    
    func toModel(entity: CDWeather, context: NSManagedObjectContext) {
        entity.id = Int32(id)
        entity.name = name
        
        entity.weatherInfo.forEach {
            context.delete($0)
        }
        
        weatherInfo.forEach {
            let cdWeatherInfo = CDWeatherInfo(context: context)
            $0.toModel(entity: cdWeatherInfo)
            entity.addToWeatherInfo(cdWeatherInfo)
        }
        
        if !entity.coord.isKind(of: CDCoordinates.self) {
            entity.coord = CDCoordinates(context: context)
        }
        
        coord.toModel(entity: entity.coord)
        
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
        
        if !entity.weatherLocation.isKind(of: CDWeatherLocation.self) {
            entity.weatherLocation = CDWeatherLocation(context: context)
        }
        weatherLocation.toModel(entity: entity.weatherLocation)
    }
    
}
