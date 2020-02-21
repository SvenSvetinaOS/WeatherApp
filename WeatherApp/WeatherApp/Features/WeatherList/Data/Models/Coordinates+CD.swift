import CoreData

extension Coordinates {
    init(with entity: CDCoordinates) {
        lon = entity.lon
        lat = entity.lat
    }

    func toModel(entity: CDCoordinates) {
        entity.lat = lat
        entity.lon = lon
    }
}
