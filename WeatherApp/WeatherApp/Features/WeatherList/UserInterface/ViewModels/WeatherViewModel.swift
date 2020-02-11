import Foundation
struct WeatherViewModel {

    let weather: Weather
    let city: String
    let country: String
    let temp: Double
    
    var temperature: String {
        return "\(Int(round(temp)))°"
    }
    
    var iconURL: URL? {
        guard var imageID = weather.weather.first?.icon else { return nil }
        imageID.append("@2x.png")
        return URL(string: imageID, relativeTo: APIConstants.imageBaseURL)
    }
    
    init(weather: Weather) {
        self.weather = weather
        city = weather.name
        country = weather.weatherLocation.country
        temp = weather.weatherMainInfo.temp
    }
    
}
