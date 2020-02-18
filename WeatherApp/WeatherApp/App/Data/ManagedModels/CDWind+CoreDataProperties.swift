import Foundation
import CoreData


extension CDWind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWind> {
        return NSFetchRequest<CDWind>(entityName: "CDWind")
    }

    @NSManaged public var speed: Double
    @NSManaged public var deg: Double
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
