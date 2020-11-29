//
//  HomeView.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 25/11/2020.
//

import SwiftUI
import SwiftUIFlux

// MARK:- Shared View

let store = Store<AppState>(reducer: appStateReducer,
                            middleware: [loggingMiddleware],
                            state: AppState())

@main
struct HomeView: App {

    init() {
        setupApperance()
    }

    var body: some Scene {
        WindowGroup {
            StoreProvider(store: store) {
                TabbarView().foregroundColor(.blue)
            }
        }
    }

    private func setupApperance() {

    }
}

// MARK: - iOS implementation
struct TabbarView: View {
    @State var selectedTab = Tab.products

    enum Tab: Int {
        case products, profile
    }

    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }

    var body: some View {
        TabView {
            ContentView(text: "Products")
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Products")
                }

            ContentView(text: "Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }

        }
    }
}

//#if DEBUG
//let sampleCustomList = CustomList(id: 0,
//                                  name: "TestName",
//                                  cover: 0,
//                                  movies: [0])
//let sampleStore = Store<AppState>(reducer: appStateReducer,
//                                  state: AppState(moviesState:
//                                                    MoviesState(movies: [0: sampleMovie],
//                                                                moviesList: [MoviesMenu.popular: [0]],
//                                                                recommended: [0: [0]],
//                                                                similar: [0: [0]],
//                                                                customLists: [0: sampleCustomList]),
//                                                  peoplesState: PeoplesState(peoples: [0: sampleCasts.first!, 1: sampleCasts[1]],
//                                                                             peoplesMovies: [:],
//                                                                             search: [:])))
//#endif
