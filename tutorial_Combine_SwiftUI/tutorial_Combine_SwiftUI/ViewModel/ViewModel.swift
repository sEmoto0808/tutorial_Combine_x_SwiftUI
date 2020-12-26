//
//  ViewModel.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    var task: AnyCancellable? = nil
    @Published var qiitaItems: [QiitaItem] = []
    
    private(set) lazy var onAppear: () -> Void = { [weak self] in
        self?.getItems()
    }
    
    func getItems() {
        self.task = APIClient.request(QiitaItemRequest())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("成功")
                case let .failure(error):
                    print(error)
                }
            },
            receiveValue: { data in
                self.qiitaItems = data
                print(data)
            })
    }
}
