import Foundation
import CoreData

public class CDForecastInfo: NSManagedObject {
    @NSManaged public var time: String
    @NSManaged public var timeUTC: Double
    @NSManaged public var weatherInfo: Set<CDWeatherInfo>
    @NSManaged public var weatherMainInfo: CDWeatherMainInfo
    @NSManaged public var clouds: CDClouds
    @NSManaged public var wind: CDWind
    @NSManaged public var forecast: CDForecast?
    
}
