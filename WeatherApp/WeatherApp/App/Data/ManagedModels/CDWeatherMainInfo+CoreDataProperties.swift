import Foundation
import CoreData

extension CDWeatherMainInfo {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherMainInfo> {
        return NSFetchRequest<CDWeatherMainInfo>(entityName: "CDWeatherMainInfo")
    }

}
