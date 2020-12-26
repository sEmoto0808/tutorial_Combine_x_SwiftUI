//
//  APIProtocols.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Alamofire

protocol APIRequestProtocol {
    associatedtype ResponseType
    
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String : String]? { get }
    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
    
    func toURLRequest() -> URLRequest
}

extension APIRequestProtocol {
    var encoding: URLEncoding { URLEncoding.default }
    var headers: [String : String]? { nil }
    
    func toURLRequest() -> URLRequest {
        let urlString = APIConstant.baseURL + path
        guard let url = URL(string: urlString) else {
            fatalError("URL Parse failed.")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = APIConstant.timeInterval
        
        return urlRequest
    }
}
