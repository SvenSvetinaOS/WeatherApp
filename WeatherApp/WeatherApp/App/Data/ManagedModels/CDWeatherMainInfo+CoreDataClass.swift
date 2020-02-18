import Foundation
import CoreData

public class CDWeatherMainInfo: NSManagedObject {
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var temp: Double
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
