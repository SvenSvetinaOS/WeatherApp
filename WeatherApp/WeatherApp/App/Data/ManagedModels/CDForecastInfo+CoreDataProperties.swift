import Foundation
import CoreData

extension CDForecastInfo {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDForecastInfo> {
        return NSFetchRequest<CDForecastInfo>(entityName: "CDForecastInfo")
    }

}

extension CDForecastInfo {

    @objc(addWeatherMainInfoObject:)
    @NSManaged public func addToWeatherMainInfo(_ value: CDWeatherMainInfo)

    @objc(removeWeatherMainInfoObject:)
    @NSManaged public func removeFromWeatherMainInfo(_ value: CDWeatherMainInfo)

    @objc(addWeatherMainInfo:)
    @NSManaged public func addToWeatherMainInfo(_ values: NSSet)

    @objc(removeWeatherMainInfo:)
    @NSManaged public func removeFromWeatherMainInfo(_ values: NSSet)

}
