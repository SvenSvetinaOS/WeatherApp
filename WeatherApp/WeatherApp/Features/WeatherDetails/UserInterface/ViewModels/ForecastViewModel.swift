import Foundation

struct ForecastViewModel {
    let forecast: ForecastInfo!
    let temp: Double
    let timeUTC: Double
    let time: String
    let timezone: Double?
    let weatherIconID: String?
    
    var iconURL: URL? {
        guard var imageID = forecast.weather.first?.icon else { return nil }
        imageID.append("@2x.png")
        return URL(string: imageID, relativeTo: APIConstants.imageBaseURL)
    }
    
    var day: String {
        return Date().getDay(from: time) ?? "-"
    }
    
    init(forecast: ForecastInfo, timezone: Double?) {
        temp = forecast.weatherMainInfo.temp
        weatherIconID = forecast.weather.first?.icon
        timeUTC = forecast.timeUTC
        time = forecast.time
        self.timezone = timezone
        self.forecast = forecast
    }
}
