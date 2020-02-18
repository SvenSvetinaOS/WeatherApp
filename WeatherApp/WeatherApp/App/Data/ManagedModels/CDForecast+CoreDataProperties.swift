import Foundation
import CoreData

extension CDForecast {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDForecast> {
        return NSFetchRequest<CDForecast>(entityName: "CDForecast")
    }

}

extension CDForecast {

    @objc(addForecastInfoObject:)
    @NSManaged public func addToForecastInfo(_ value: CDForecastInfo)

    @objc(removeForecastInfoObject:)
    @NSManaged public func removeFromForecastInfo(_ value: CDForecastInfo)

    @objc(addForecastInfo:)
    @NSManaged public func addToForecastInfo(_ values: NSSet)

    @objc(removeForecastInfo:)
    @NSManaged public func removeFromForecastInfo(_ values: NSSet)

}
