import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: Constants.HTTPHeaderField.contentType) == nil {
                urlRequest.setValue(Constants.json,
                                    forHTTPHeaderField: Constants.HTTPHeaderField.contentType)
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
    
}
