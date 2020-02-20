import Foundation
import CoreData

public class CDWeather: NSManagedObject {
    @NSManaged public var id: Int32
    @NSManaged public var name: String
    @NSManaged public var clouds: CDClouds
    @NSManaged public var wind: CDWind
    @NSManaged public var weatherMainInfo: CDWeatherMainInfo
    @NSManaged public var weatherLocation: CDWeatherLocation
    @NSManaged public var weatherInfo: Set<CDWeatherInfo>
    @NSManaged public var coord: CDCoordinates

}
