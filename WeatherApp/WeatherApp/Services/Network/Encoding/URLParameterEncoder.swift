import Foundation

struct URLParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw NetworkError.invalidURL }
        
        if
            var urlComponents = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false),
            !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key,value) in parameters {
                let queryItem = URLQueryItem(
                    name: key,
                    value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType) == nil {
            urlRequest.setValue(APIConstants.urlEncoded, forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType)
        }
    }
    
}
