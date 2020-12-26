//
//  URLImageLoader.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import Combine
import SwiftUI

class URLImageLoader: ObservableObject {

    let url: String?
    
    /// ダウンロード処理の呼び出し
    private(set) lazy var onAppear: () -> Void = { [weak self] in
        self?.downloadImage(url: self?.url)
    }
    
    /// 取得した画像データを通知
    @Published var image: Image?
    
    init(url: String?) {
        self.url = url
    }
    
    func downloadImage(url: String?) {
        guard let url = url,
              let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = Image(uiImage: image)
            }
        }.resume()
    }
}
