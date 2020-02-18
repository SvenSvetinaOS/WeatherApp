import Foundation
import CoreData

public class CDForecastInfo: NSManagedObject {
    @NSManaged public var time: String?
    @NSManaged public var timeUTC: Double
    @NSManaged public var weatherInfo: CDWeatherInfo?
    @NSManaged public var weatherMainInfo: NSSet?
    @NSManaged public var clouds: CDClouds?
    @NSManaged public var wind: CDWind?
    @NSManaged public var forecast: CDForecast?
    
}
