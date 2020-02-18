import Foundation
import CoreData

extension CDWeather {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

}

extension CDWeather {

    @objc(addWeatherInfoObject:)
    @NSManaged public func addToWeatherInfo(_ value: CDWeatherInfo)

    @objc(removeWeatherInfoObject:)
    @NSManaged public func removeFromWeatherInfo(_ value: CDWeatherInfo)

    @objc(addWeatherInfo:)
    @NSManaged public func addToWeatherInfo(_ values: NSSet)

    @objc(removeWeatherInfo:)
    @NSManaged public func removeFromWeatherInfo(_ values: NSSet)

}
