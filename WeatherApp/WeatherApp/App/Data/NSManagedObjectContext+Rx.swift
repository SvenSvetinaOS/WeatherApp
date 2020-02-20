import CoreData
import RxSwift

extension NSManagedObjectContext {
    func entities(_ query: NSFetchRequest<NSFetchRequestResult>) -> Observable<[NSManagedObject]> {
        
        return Observable.create { observer in
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: query, managedObjectContext: self, sectionNameKeyPath: nil, cacheName: nil)
            
            let observerAdapter = FetchedResultsControllerEntityObserver(observer: observer, frc: fetchedResultsController)
            
            return Disposables.create {
                observerAdapter.dispose()
            }
        }
    }
}
