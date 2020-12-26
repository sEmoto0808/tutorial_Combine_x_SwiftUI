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
    
    func toURLRequest() throws -> URLRequest {
        let urlString = APIConstant.baseURL + path
        
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = APIConstant.timeInterval
        
        return urlRequest
    }
}
