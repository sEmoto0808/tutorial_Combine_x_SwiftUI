//
//  URLImage.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import SwiftUI

struct URLImage<Content>: View where Content: View {

    @ObservedObject var imageLoader : URLImageLoader
    
    private let url: String?
    private let content: (_ image: Image) -> Content
    
    init(url: String?, content: @escaping (_ image: Image) -> Content) {
        self.url = url
        self.content = content
        self.imageLoader = URLImageLoader(url: url)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                content(imageLoader.image!)
            } else {
                content(Image("placeholder"))
            }
        }
        .onAppear(perform: imageLoader.onAppear)
    }

}

