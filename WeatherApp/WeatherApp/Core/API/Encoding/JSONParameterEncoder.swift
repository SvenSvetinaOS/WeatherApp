import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType) == nil {
                
                urlRequest.setValue(
                    APIConstants.json,
                    forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType
                )
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
    
}
