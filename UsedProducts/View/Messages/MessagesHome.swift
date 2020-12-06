//
//  MessagesHome.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct MessagesHome: View {

    @EnvironmentObject private var store: Store<AppState>
    @State private var isDeleteActive = false

    private var deleteButton: some View {
        Button(action: {
            self.isDeleteActive = true
        }) {
            HStack {
                Image(systemName: "trash").imageScale(.medium)
            }.frame(width: 30, height: 30)
        }
    }

    private var home: some View {
        MessagesHomeList()
            .navigationBarTitle("Messages")
            .onAppear {
                loadMessages()
            }
    }

    var body: some View {
        NavigationView {
            Group {
                home
            }
            .navigationBarItems(trailing:
                                    HStack {
                                        deleteButton
                                    }
            )
        }
    }

    // MARK: - Action
    private func loadMessages() {
        store.dispatch(action: MessagesActions.FetchMessages())
    }
}

//struct MessagesHome_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagesHome()
//    }
//}
