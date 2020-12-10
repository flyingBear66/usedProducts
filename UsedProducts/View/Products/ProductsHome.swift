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
    @State private var isFiltersPresented = false
    @State private var isProfilePresented = false
    @State private var isSearchPresented = false
    @State private var searchText = ""

    private var settingButton: some View {
        Button(action: {
            self.isSettingPresented = true
        }) {
            HStack {
                Image(systemName: "wrench").imageScale(.medium)
            }
            .frame(width: 30, height: 30)
        }
    }

    private var filtersButton: some View {
        Button(action: {
            self.isFiltersPresented = true
        }) {
            HStack {
                Image(systemName: "line.horizontal.3.decrease.circle").imageScale(.medium)
            }
            .foregroundColor(.gray)
            .frame(width: 30, height: 30)
        }
    }

    private var profileImageButton: some View {
        Button(action : {
            self.isProfilePresented = true
        }) {
            UserImage(user: sampleUser4)
                .frame(width: 30, height: 30)
        }
    }

    private var home: some View {
        ProductsHomeList()
    }

    private var leadingBarItem: some View {
        HStack {
            profileImageButton
                .sheet(isPresented: $isProfilePresented, content: { ContentView(text: "Profile") })
        }
    }

    private var trailingBarItem: some View {
        HStack {
            //            settingButton
            //                .sheet(isPresented: $isSettingPresented, content: { ContentView(text: "Settings") })
            filtersButton
                .sheet(isPresented: $isFiltersPresented, content: { ContentView(text: "Filters") })
        }
    }

    private var searchBarItemView: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)

                TextField("Search product here", text: self.$searchText, onEditingChanged: { editingChanged in
                    if editingChanged {
                        self.isSearchPresented = true
                        UIApplication.shared.endEditing() // Call to dismiss keyboard

                    }
                })
                .foregroundColor(Color.gray)
                .sheet(isPresented: $isSearchPresented, content: { ContentView(text: "Search") })
            }
            .frame(width: 250, height: 35, alignment: .center)
            .background(Color(red: 228, green: 228, blue: 228))
            .cornerRadius(5)
    }

    var body: some View {
        NavigationView {
            Group {
                home
            }
            .navigationBarItems(
                leading: leadingBarItem,
                trailing: trailingBarItem
            )
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    searchBarItemView
                }
            })
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//#if DEBUG
//struct MoviesHome_Previews : PreviewProvider {
//    static var previews: some View {
//        MoviesHome().environmentObject(sampleStore)
//    }
//}
//#endif
