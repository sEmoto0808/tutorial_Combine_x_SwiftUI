//
//  DetailView.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import SwiftUI

struct DetailView: View {

    @Binding var qiitaItem: QiitaItem

    var body: some View {
        VStack {
            HStack {
                Text(qiitaItem.title)
                Spacer()
            }
        }
    }
}
