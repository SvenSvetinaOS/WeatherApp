import CoreData

extension Wind {
    init(with entity: CDWind) {
        speed = entity.speed
        deg = entity.deg
    }
    
    func toModel(entity: CDWind) {
        entity.speed = speed
        if let deg = deg {
            entity.deg = deg
        }
    }
}
