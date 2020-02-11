import Foundation

enum WeatherEndPoint {
    case current(cityIds: [Int])
}

extension WeatherEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError(NetworkError.invalidURL.rawValue) }
        return url
    }
    
    var path: String {
        switch self {
        case .current:
            return APIConstants.group
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .current:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .current(let cityIds):
            return .requestParameters(
                encoding: .urlEncoding,
                bodyParameters: nil,
                urlParameters: [APIConstants.cityId: cityIds.map{String($0)}.joined(separator: ","),
                                APIConstants.appId: APIConstants.apiKey,
                                APIConstants.unitFormat: APIConstants.metricUnits
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
