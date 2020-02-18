import Foundation
import CoreData


extension CDWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: Int32
    @NSManaged public var clouds: CDClouds?
    @NSManaged public var wind: CDWind?
    @NSManaged public var weatherMainInfo: CDWeatherMainInfo?
    @NSManaged public var weatherLocation: CDWeatherLocation?
    @NSManaged public var weatherInfo: NSSet?
    @NSManaged public var coord: CDCoordinates?

}

// MARK: Generated accessors for weatherInfo
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
