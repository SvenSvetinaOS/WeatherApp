import CoreData

extension WeatherMainInfo {
    init(with entity: CDWeatherMainInfo) {
        temp = entity.temp
        tempMin = entity.tempMin
        tempMax = entity.tempMax
    }

    func toModel(entity: CDWeatherMainInfo) {
        entity.temp = temp
        entity.tempMax = tempMax
        entity.tempMin = tempMin
    }
}

