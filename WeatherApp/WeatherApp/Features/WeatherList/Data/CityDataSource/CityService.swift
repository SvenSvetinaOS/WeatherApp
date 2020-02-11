import Foundation

class CityService: CityServiceProtocol {
    var cities: [City] {
        if let path = Bundle.main.path(forResource: "CityData", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let values = try JSONDecoder().decode([City].self, from: data)
                    return values
                }catch {
                    print(error)
                }
            }
            return []
        }
    
}
