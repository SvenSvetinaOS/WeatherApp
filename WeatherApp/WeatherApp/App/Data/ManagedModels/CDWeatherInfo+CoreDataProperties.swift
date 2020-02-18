import Foundation
import CoreData


extension CDWeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherInfo> {
        return NSFetchRequest<CDWeatherInfo>(entityName: "CDWeatherInfo")
    }

    @NSManaged public var icon: String?
    @NSManaged public var main: String?
    @NSManaged public var descr: String?
    @NSManaged public var id: Int32
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
