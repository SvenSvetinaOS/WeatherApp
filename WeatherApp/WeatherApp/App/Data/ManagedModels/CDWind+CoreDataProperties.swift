import Foundation
import CoreData


extension CDWind {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWind> {
        return NSFetchRequest<CDWind>(entityName: "CDWind")
    }

}
