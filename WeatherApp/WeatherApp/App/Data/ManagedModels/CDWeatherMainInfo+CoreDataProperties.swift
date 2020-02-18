import Foundation
import CoreData


extension CDWeatherMainInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherMainInfo> {
        return NSFetchRequest<CDWeatherMainInfo>(entityName: "CDWeatherMainInfo")
    }

    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var temp: Double
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
