import Foundation

enum ForecastEndPoint {
    case forecast(cityId: Int)
}

extension ForecastEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError (NetworkError.invalidURL.rawValue) }
        return url
    }
    
    var path: String {
        switch self {
        case .forecast:
            return APIConstants.forecast
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .forecast(let cityId):
            return .requestParameters(
                encoding: .urlEncoding,
                bodyParameters: nil,
                urlParameters: [APIConstants.cityId: cityId,
                                APIConstants.unitFormat: APIConstants.metricUnits,
                                APIConstants.appId: APIConstants.apiKey])
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .forecast:
            return nil
        }
    }
}
