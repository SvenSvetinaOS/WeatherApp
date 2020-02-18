import Foundation
import CoreData

extension CDCity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

}
