//
//  QiitaItem.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation

struct QiitaItem: Codable {
    let id: String
    let title: String
    let user: User
    let tags: [Tag]
}
