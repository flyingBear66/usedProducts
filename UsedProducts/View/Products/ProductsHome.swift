//
//  ProductsHome.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import Combine
import SwiftUIFlux

struct ProductsHome : View {

    @EnvironmentObject private var store: Store<AppState>
    @State private var isSettingPresented = false

    private var settingButton: some View {
        Button(action: {
            self.isSettingPresented = true
        }) {
            HStack {
                Image(systemName: "wrench").imageScale(.medium)
            }.frame(width: 30, height: 30)
        }
    }

    private var home: some View {
        ProductsHomeList()
    }

    var body: some View {
        NavigationView {
            Group {
                home
            }
            .navigationBarItems(trailing:
                                    HStack {
                                        settingButton
                                    }
            )
            .sheet(isPresented: $isSettingPresented,
                   content: { ContentView(text: "Settings") })
        }
    }
}

//#if DEBUG
//struct MoviesHome_Previews : PreviewProvider {
//    static var previews: some View {
//        MoviesHome().environmentObject(sampleStore)
//    }
//}
//#endif
