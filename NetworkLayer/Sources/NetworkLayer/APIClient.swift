//
//  File.swift
//  
//
//  Created by Sko on 3/7/22.
//

import Combine
import Foundation

public protocol APIClient {
    func fetch<T>(endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

public extension APIClient {
    func fetch<T>(endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        let urlComponent = URLComponents(string: <#T##String#>)
        urlComponent?.queryItems?.append(<#T##Element#>)
        var urlRequest = URLRequest(url: )
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {
            urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)
        }
        urlReques
        
      return  URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse,
                            200..<300 ~= httpResponse.statusCode else {
                                switch (response as! HTTPURLResponse).statusCode {
                                case (400...499):
                                    throw ServiceErrors.internalError((response as! HTTPURLResponse).statusCode)
                                default:
                                    throw ServiceErrors.serverError((response as! HTTPURLResponse).statusCode)
                                }
                        }
                        return data
                    }
                    .mapError { $0 as! ServiceErrors }
                    .decode(type: T.self, decoder: JSONDecoder())
                    .receive(on: RunLoop.main)
                    .eraseToAnyPublisher()
    }
}
enum ServiceErrors: Error {
    case internalError(_ statusCode: Int)
    case serverError(_ statusCode: Int)
}
