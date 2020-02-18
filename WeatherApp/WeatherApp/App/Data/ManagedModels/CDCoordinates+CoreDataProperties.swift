import Foundation
import CoreData

extension CDCoordinates {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCoordinates> {
        return NSFetchRequest<CDCoordinates>(entityName: "CDCoordinates")
    }

}
