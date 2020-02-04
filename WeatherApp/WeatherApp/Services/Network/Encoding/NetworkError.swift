import Foundation

enum NetworkError: String, Error {
    case parametersNil = "Parameters are nil"
    case encodingFailed = "Encoding has failed"
    case invalidURL = "Invalid URL"
}
