//
//  Repository.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Combine

struct Repository {
    
    func getQiitaItems() -> Future<[QiitaItem], APIError> {
        let request = QiitaItemRequest()
        return APIClient.request(request)
    }
}
