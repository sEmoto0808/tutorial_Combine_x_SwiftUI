//
//  APIClient.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Alamofire
import Combine

struct APIClient {

    static let decorder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
      }()

    static func request<T, V>(_ request: T) -> Future<V, APIError>
        where T: APIRequestProtocol, V: Codable, T.ResponseType == V {
        
        let urlRequest = request.toURLRequest()
        let future = Future<V, APIError> { promise in
            
            let task = AF.request(urlRequest)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        do {
                            if let json = response.data {
                                let value = try APIClient.decorder.decode(V.self, from: json)
                                promise(.success(value))
                            }
                        } catch {
                            promise(.failure(.init(statusCode: response.response?.statusCode ?? 0,
                                                   message: "Parse failed")))
                        }
                    case .failure(let error):
                        promise(.failure(.init(statusCode: response.response?.statusCode ?? 0,
                                               message: error.errorDescription ?? "")))
                    }
                }
            task.resume()
        }
        
        return future
    }
}
