//
//  APIError.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

struct APIError: Error {
    let statusCode: Int
    let message: String
}
