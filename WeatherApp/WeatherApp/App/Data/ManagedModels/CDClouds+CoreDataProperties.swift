import Foundation
import CoreData


extension CDClouds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClouds> {
        return NSFetchRequest<CDClouds>(entityName: "CDClouds")
    }

    @NSManaged public var cloudiness: Int32
    @NSManaged public var weather: CDWeather?
    @NSManaged public var forecastInfo: CDForecastInfo?

}
