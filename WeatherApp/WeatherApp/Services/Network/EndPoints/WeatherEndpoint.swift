import Foundation

enum WeatherEndPoint {
    case current(cityId: Int)
}

extension WeatherEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError(NetworkError.invalidURL.rawValue) }
        return url
    }
    
    var path: String {
        switch self {
        case .current:
            return APIConstants.weather
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .current(let cityId):
            return .requestParameters(
                encoding: .urlEncoding,
                bodyParameters: nil,
                urlParameters: [APIConstants.cityId: cityId,
                                APIConstants.appId: APIConstants.apiKey
            ])
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .current:
            return nil
        }
    }
}
