//
//  UseCase.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Combine

struct UseCase {
    private let repository = Repository()
    
    func getQiitaItems() -> Future<[QiitaItem], APIError> {
        repository.getQiitaItems()
    }
}
