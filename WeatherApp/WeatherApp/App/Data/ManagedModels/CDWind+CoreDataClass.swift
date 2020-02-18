import Foundation
import CoreData

public class CDWind: NSManagedObject {
    @NSManaged public var speed: Double
    @NSManaged public var deg: Double
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?
    
}
