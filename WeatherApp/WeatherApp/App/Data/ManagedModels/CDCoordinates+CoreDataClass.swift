import Foundation
import CoreData

public class CDCoordinates: NSManagedObject {
    @NSManaged public var lon: Double
    @NSManaged public var lat: Double
    @NSManaged public var city: CDCity?
    @NSManaged public var weather: CDWeather?

}
