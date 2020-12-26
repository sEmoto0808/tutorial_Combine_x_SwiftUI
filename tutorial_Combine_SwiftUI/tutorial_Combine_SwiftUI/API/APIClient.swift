//
//  APIClient.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Alamofire

struct APIClient {
    func request(_ request: URLRequest) {
        
        let task = AF.request(request).responseJSON { response in}
        task.resume()
    }
}
