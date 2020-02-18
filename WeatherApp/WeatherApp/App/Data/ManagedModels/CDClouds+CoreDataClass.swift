import Foundation
import CoreData

public class CDClouds: NSManagedObject {
    @NSManaged public var cloudiness: Int32
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?
    
}
