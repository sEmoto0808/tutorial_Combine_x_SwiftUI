//
//  DetailView.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import SwiftUI
import Combine
import Foundation

struct DetailView: View {

    @Binding var qiitaItem: QiitaItem

    var body: some View {
        VStack {
            URLImage(url: qiitaItem.user.profileImageUrl) {
                $0.renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 250.0, height: 250.0)
                    .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
            }

            HStack {
                let userName: String = qiitaItem.user.name.isEmpty ? "No Name" : qiitaItem.user.name
                Spacer(minLength: 8)
                Text(userName)
                    .font(Font.system(size: 17))
                Spacer(minLength: 8)
            }
            .padding(.top, 12.0)

            HStack {
                Spacer(minLength: 8)
                Text(qiitaItem.title)
                    .font(Font.system(size: 22, weight: .bold, design: .default))
                Spacer(minLength: 8)
            }
            .padding(.top, 12.0)

            Spacer()
        }
    }
}
