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

enum Tab: Int, CaseIterable, Identifiable {

    var id: Int {
        return self.rawValue
    }

    case home, messages ,profile
}

extension Tab {

    var title: String {
        switch self {
        case .home: return "Home"
        case .messages: return "Messages"
        case .profile: return "Profile"
        }
    }

    var image: Image {
        switch self {
        case .home: return Image(systemName: "list.dash")
        case .messages: return Image(systemName: "message")
        case .profile: return Image(systemName: "person.crop.circle")
        }
    }

    var text: Text {
        switch self {
        case .home: return Text("Products")
        case .messages: return Text("Messages")
        case .profile: return Text("Profile")
        }
    }
}

// MARK: - iOS implementation
struct TabbarView: View {
    @State var selectedTab = Tab.home

    func tabbarItem(of tab: Tab) -> some View {
        VStack {
            tab.image
            tab.text
        }
    }

    var body: some View {
        TabView {
            ProductsHome()
                .tabItem {
                    self.tabbarItem(of: .home)
                }

            ContentView(text: Tab.messages.title)
                .tabItem {
                    self.tabbarItem(of: .messages)
                }

            ContentView(text: Tab.profile.title)
                .tabItem {
                    self.tabbarItem(of: .profile)

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
