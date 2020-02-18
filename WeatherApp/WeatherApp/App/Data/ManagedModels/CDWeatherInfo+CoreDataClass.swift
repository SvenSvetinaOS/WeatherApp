import Foundation
import CoreData

public class CDWeatherInfo: NSManagedObject {
    @NSManaged public var icon: String?
    @NSManaged public var main: String?
    @NSManaged public var descr: String?
    @NSManaged public var id: Int32
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
