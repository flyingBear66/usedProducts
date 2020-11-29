//
//  ContentView.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import SwiftUI

struct ContentView: View {

    private var text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .padding()
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
