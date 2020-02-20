import Foundation
import CoreData

public class CDCity: NSManagedObject {
    @NSManaged public var timezone: Double
    @NSManaged public var name: String
    @NSManaged public var id: Int32
    @NSManaged public var country: String
    @NSManaged public var forecast: CDForecast?
    @NSManaged public var coord: CDCoordinates
    
}
