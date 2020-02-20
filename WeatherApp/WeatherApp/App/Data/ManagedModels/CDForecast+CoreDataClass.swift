import Foundation
import CoreData

public class CDForecast: NSManagedObject {
    @NSManaged public var cnt: Int32
    @NSManaged public var city: CDCity
    @NSManaged public var forecastInfo: Set<CDForecastInfo>

}
