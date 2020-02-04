enum HTTPTask {
    case request
            
    case requestParameters(encoding: ParameterEncoding,
                           bodyParameters: Parameters?,
                           urlParameters: Parameters?)
}
