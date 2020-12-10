//
//  NotificationsHome.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct NotificationsHome: View {

    // MARK: - Vars
    @EnvironmentObject private var store: Store<AppState>
    @State private var isSettingsAction = false

    // MARK: - Views
    private var settingsButton: some View {
        Button(action: {
            self.isSettingsAction = true
        }) {
            HStack {
                Image(systemName: "gearshape.fill").imageScale(.medium)
            }.frame(width: 30, height: 30)
        }
    }

    private var home: some View {
        NotificationsHomeList()
            .navigationBarTitle("Notifications")
            .onAppear {
                loadNotifications()
            }
    }

    var body: some View {
        NavigationView {
            Group {
                home
            }
            .navigationBarItems(trailing:
                                    HStack {
                                        settingsButton
                                    }
            )
            .sheet(isPresented: $isSettingsAction, content: { ContentView(text: "Notification Settings") })
        }
    }

    // MARK: - Action
    private func loadNotifications() {
        store.dispatch(action: NotificationsActions.FetchNotifications())
    }
}

//struct NotificationsHome_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsHome()
//    }
//}
