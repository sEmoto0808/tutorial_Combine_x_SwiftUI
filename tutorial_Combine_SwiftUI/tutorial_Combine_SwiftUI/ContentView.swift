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
        Text("Hello, world!")
            .padding()
            .onAppear(perform: observed.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
