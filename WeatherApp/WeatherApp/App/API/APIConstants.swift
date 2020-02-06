enum APIConstants {
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    static let urlEncoded = "application/x-www-form-urlencoded; charset=utf-8"
    static let json = "application/json"
    static let appId = "APPID"
    static let apiKey = "bf9340088e273afa58702aeee6f26ffb"
    static let cityId = "id"
    static let group = "group"
    
    enum HTTPHeaderField {
        static let authorization = "Authorization"
        static let contentType = "Content-Type"
        static let accept = "Accept"
        static let acceptEncoding = "Accept-Encoding"
    }
    
}
