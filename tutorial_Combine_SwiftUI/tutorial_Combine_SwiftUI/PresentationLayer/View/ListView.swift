//
//  ListView.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import SwiftUI

struct ListView: View {

    @Binding var qiitaItem: QiitaItem

    var body: some View {
        VStack {
            HStack {
                Text(qiitaItem.user.id)
                Spacer()
            }
            HStack {
                Text(qiitaItem.title)
                Spacer()
            }
            HStack {
                ForEach(qiitaItem.tags, id: \.name) { tag in
                    Text(tag.name)
                        .padding(.horizontal, 5.0)
                        .padding(.vertical, 3.0)
                        .background(Color.gray)
                        .font(Font.system(size: 10, weight: .light, design: .default))
                        .cornerRadius(5)
                }
                Spacer()
            }
        }
    }
}
