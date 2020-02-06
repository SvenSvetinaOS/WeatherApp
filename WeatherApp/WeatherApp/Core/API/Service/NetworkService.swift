import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    private let baseURL = APIConstants.baseURL
    
    func fetchData<T: Codable>(route: EndPointType, completion: @escaping (T) -> Void) {
        do {
            let request = try self.buildRequest(from: route)
            session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error.debugDescription)
                }
                guard let data = data else { return }
                do {
                    let result = try self.decoder.decode(T.self, from: data)
                    completion(result)
                } catch (let error)  {
                    print(error.localizedDescription)
                }
            }.resume()
        } catch (let error) {
            print(error)
        }
    }
    
    private func buildRequest(from route: EndPointType) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path))
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case .request:
                request.setValue(
                    APIConstants.json,
                    forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType
                )
                
            case .requestParameters(
                let bodyEncoding,
                let bodyParameters,
                let urlParameters):
                
                try self.configureParameters(
                    bodyEncoding: bodyEncoding,
                    bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(
        bodyEncoding: ParameterEncoding,
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        request: inout URLRequest
    ) throws {
        do {
            try bodyEncoding.encode(
                urlRequest: &request,
                bodyParameters: bodyParameters,
                urlParameters: urlParameters
            )
        } catch {
            throw error
        }
    }
    
}


