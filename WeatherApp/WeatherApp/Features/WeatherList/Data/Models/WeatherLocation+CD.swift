import CoreData

extension WeatherLocation {
    init(with entity: CDWeatherLocation) {
        country = entity.country
        sunrise = Int(entity.sunrise)
        sunset = Int(entity.sunset)
    }

    func toModel(entity: CDWeatherLocation) {
        entity.country = country
        entity.sunrise = Int32(sunrise)
        entity.sunset = Int32(sunset)
    }
}
