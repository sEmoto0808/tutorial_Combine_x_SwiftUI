//
//  QiitaItemRequest.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Alamofire

struct QiitaItemRequest: APIRequestProtocol {

    typealias ResponseType = [QiitaItem]
    
    var path: String = "items"
    var parameters: Parameters? = nil
    var method: HTTPMethod = .get
}
