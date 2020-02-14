import Foundation

extension Date {
    
    func getTime(timeUTC: Double = Date().timeIntervalSince1970, timezoneUTC: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeUTC + timezoneUTC))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func getDay(from string: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: string) else { return nil }
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let weekday = calendar.component(.weekday, from: date)
        return calendar.shortWeekdaySymbols[weekday-1]
    }
    
    func getHour(from string: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: string) else { return nil }
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.component(.hour, from: date)
    }
}

