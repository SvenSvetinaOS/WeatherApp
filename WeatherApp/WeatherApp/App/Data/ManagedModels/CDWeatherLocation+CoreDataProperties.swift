import Foundation
import CoreData


extension CDWeatherLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherLocation> {
        return NSFetchRequest<CDWeatherLocation>(entityName: "CDWeatherLocation")
    }

    @NSManaged public var sunset: Int32
    @NSManaged public var sunrise: Int32
    @NSManaged public var country: String?
    @NSManaged public var weather: CDWeather?

}
