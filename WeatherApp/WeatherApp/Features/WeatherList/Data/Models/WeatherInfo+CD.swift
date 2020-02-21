import CoreData

extension WeatherInfo {
    init(with entity: CDWeatherInfo) {
        id = Int(entity.id)
        main = entity.main
        description = entity.descr
        icon = entity.icon
    }

    func toModel(entity: CDWeatherInfo) {
        entity.id = Int32(id)
        entity.main = main
        entity.descr = description
        entity.icon = icon
    }
}
