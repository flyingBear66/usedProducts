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

    private var segmentedView: some View {
        ScrollableSelector(items: MoviesMenu.allCases.map{ $0.title() },
                           selection: Binding<Int>(
                            get: {
                                self.selectedMenu.menu.rawValue
                           },
                            set: {
                                self.selectedMenu.menu = MoviesMenu(rawValue: $0)!
                           })
        )
    }

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
        Group {
            MoviesHomeList(menu: $selectedMenu.menu,
                           pageListener: selectedMenu.pageListener,
                           headerView: AnyView(segmentedView))
        }
    }

    var body: some View {
        NavigationView {
            Group {
                homeAsList
            }
            .navigationBarItems(trailing:
                                    HStack {
                                        settingButton
                                    }
            ).sheet(isPresented: $isSettingPresented,
                    content: { SettingsForm() })
        }
    }
}

#if DEBUG
struct MoviesHome_Previews : PreviewProvider {
    static var previews: some View {
        MoviesHome().environmentObject(sampleStore)
    }
}
#endif
