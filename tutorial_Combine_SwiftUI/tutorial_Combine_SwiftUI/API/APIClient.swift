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

    func request(_ request: URLRequest) -> Future<String, APIError> {
        
        let task = AF.request(request).responseJSON { response in}
        task.resume()
        
        let future = Future<String, APIError> { promise in
            let task = AF.request(request)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        promise(.success("Success"))
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
