import CoreData

extension Clouds {
    init(with entity: CDClouds) {
        cloudiness = Int(entity.cloudiness)
    }

    func toModel(entity: CDClouds) {
        entity.cloudiness = Int32(cloudiness)
    }
}
