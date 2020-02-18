import Foundation
import CoreData

public class CDWeatherLocation: NSManagedObject {
    @NSManaged public var sunset: Int32
    @NSManaged public var sunrise: Int32
    @NSManaged public var country: String?
    @NSManaged public var weather: CDWeather?

}
