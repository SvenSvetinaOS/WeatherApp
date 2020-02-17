import Foundation
import RxSwift

class NetworkService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    private let baseURL = APIConstants.baseURL
    
    func fetchData<T: Codable>(route: EndPointType) -> Single<T> {
        return Single<T>.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            do {
                let request = try self.buildRequest(from: route)
                self.session.dataTask(with: request) { data, response, error in
                    if error != nil {
                        observer(.error(error!))
                    }
                    guard let data = data else { return }
                    do {
                        let result = try self.decoder.decode(T.self, from: data)
                        observer(.success(result))
                    } catch (let error)  {
                        observer(.error(error))
                    }
                }.resume()
            } catch (let error) {
                observer(.error(error))
            }
            return Disposables.create()
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


