import Foundation
import CoreData


extension CDCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

    @NSManaged public var timezone: Double
    @NSManaged public var name: String?
    @NSManaged public var id: Int32
    @NSManaged public var country: String?
    @NSManaged public var forecast: CDForecast?
    @NSManaged public var coord: CDCoordinates?

}
