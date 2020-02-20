import Foundation
import CoreData

extension CDForecastInfo {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDForecastInfo> {
        return NSFetchRequest<CDForecastInfo>(entityName: "CDForecastInfo")
    }

}

extension CDForecastInfo {

    @objc(addWeatherInfoObject:)
    @NSManaged public func addToWeatherInfo(_ value: CDWeatherInfo)

    @objc(removeWeatherInfoObject:)
    @NSManaged public func removeFromWeatherInfo(_ value: CDWeatherInfo)

    @objc(addWeatherInfo:)
    @NSManaged public func addToWeatherInfo(_ values: NSSet)

    @objc(removeWeatherInfo:)
    @NSManaged public func removeFromWeatherInfo(_ values: NSSet)

}
