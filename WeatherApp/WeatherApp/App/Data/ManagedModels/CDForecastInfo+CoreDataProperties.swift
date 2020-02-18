import Foundation
import CoreData


extension CDForecastInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDForecastInfo> {
        return NSFetchRequest<CDForecastInfo>(entityName: "CDForecastInfo")
    }

    @NSManaged public var time: String?
    @NSManaged public var timeUTC: Double
    @NSManaged public var weatherInfo: CDWeatherInfo?
    @NSManaged public var weatherMainInfo: NSSet?
    @NSManaged public var clouds: CDClouds?
    @NSManaged public var wind: CDWind?
    @NSManaged public var forecast: CDForecast?

}

// MARK: Generated accessors for weatherMainInfo
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
