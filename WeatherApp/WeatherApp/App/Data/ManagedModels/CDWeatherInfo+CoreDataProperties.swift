import Foundation
import CoreData

extension CDWeatherInfo {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherInfo> {
        return NSFetchRequest<CDWeatherInfo>(entityName: "CDWeatherInfo")
    }

}
