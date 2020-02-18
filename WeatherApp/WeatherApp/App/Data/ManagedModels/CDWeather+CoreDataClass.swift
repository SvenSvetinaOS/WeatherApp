import Foundation
import CoreData

public class CDWeather: NSManagedObject {
    @NSManaged public var id: Int32
    @NSManaged public var name: Int32
    @NSManaged public var clouds: CDClouds?
    @NSManaged public var wind: CDWind?
    @NSManaged public var weatherMainInfo: CDWeatherMainInfo?
    @NSManaged public var weatherLocation: CDWeatherLocation?
    @NSManaged public var weatherInfo: NSSet?
    @NSManaged public var coord: CDCoordinates?

}
