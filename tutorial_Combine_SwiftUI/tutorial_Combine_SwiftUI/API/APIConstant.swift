//
//  APIConstant.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation

struct APIConstant {
    
    static var baseURL: String {
        #if DEBUG
        return "https://qiita.com/api/v2/"
        #else
        return "https://qiita.com/api/v2/"
        #endif
    }
    
    static let timeInterval = TimeInterval(30)
}
