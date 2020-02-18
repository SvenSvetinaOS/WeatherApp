import Foundation
import CoreData

extension CDClouds {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClouds> {
        return NSFetchRequest<CDClouds>(entityName: "CDClouds")
    }

}
