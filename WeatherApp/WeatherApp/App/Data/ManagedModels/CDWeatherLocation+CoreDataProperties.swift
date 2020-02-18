import Foundation
import CoreData

extension CDWeatherLocation {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherLocation> {
        return NSFetchRequest<CDWeatherLocation>(entityName: "CDWeatherLocation")
    }

}
