import CoreData

extension City {
    init(with entity: CDCity) {
        id = Int(entity.id)
        name = entity.name
        country = entity.country
        timezone = entity.timezone
        coord = Coordinates(with: entity.coord)
    }

    func toModel(entity: CDCity, context: NSManagedObjectContext) {
        entity.country = country
        entity.name = name
        entity.id = Int32(id)
        entity.timezone = timezone ?? 0
        if !entity.coord.isKind(of: CDCoordinates.self) {
            entity.coord = CDCoordinates(context: context)
        }
        coord.toModel(entity: entity.coord)
    }
}

