import Foundation
import CoreData


extension CDCoordinates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCoordinates> {
        return NSFetchRequest<CDCoordinates>(entityName: "CDCoordinates")
    }

    @NSManaged public var lon: Double
    @NSManaged public var lat: Double
    @NSManaged public var city: CDCity?
    @NSManaged public var weather: CDWeather?

}
