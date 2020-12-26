//
//  ContentView.swift
//  tutorial_Combine_SwiftUI
//
//  Created by 江本匠 on 2020/12/26.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var observed = ViewModel()

    var body: some View {
        NavigationView {
            List(observed.qiitaItems.indices, id: \.self) { index in
                NavigationLink(destination: DetailView(qiitaItem: self.$observed.qiitaItems[index]),
                               label: {
                                ListView(qiitaItem: self.$observed.qiitaItems[index])
                               })
            }
            .navigationBarTitle("新着", displayMode: .automatic)
        }
        .onAppear(perform: observed.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
