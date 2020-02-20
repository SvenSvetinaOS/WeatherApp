import Foundation

struct WeatherViewModel {
    
    let id: Int
    let weather: Weather
    let city: String
    let country: String
    let temp: Double
    
    var temperature: String {
        return "\(Int(round(temp)))°"
    }
    
    var iconURL: URL? {
        guard var imageID = weather.weatherInfo.first?.icon else { return nil }
        imageID.append("@2x.png")
        return URL(string: imageID, relativeTo: APIConstants.imageBaseURL)
    }
    
    init(weather: Weather) {
        self.weather = weather
        self.id = weather.id
        city = weather.name
        country = weather.weatherLocation.country
        temp = weather.weatherMainInfo.temp
    }
    
}
