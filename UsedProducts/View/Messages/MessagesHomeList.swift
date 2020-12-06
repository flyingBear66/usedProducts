//
//  MessagesHomeList.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct MessagesHomeList: ConnectedView {

    struct Props {
        let messages: [Int]
    }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(messages: state.messagesState.messages.map { $0.id })
    }

    func body(props: Props) -> some View {
        List {
            Group {
                Section {
                    ForEach(props.messages, id: \.self) { id in
                        NavigationLink(destination: ContentView(text: "Message Detail")) {
                            MessageRow(messageId: id)
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
        }
        .listStyle(PlainListStyle())
    }

    private func delete(at offsets: IndexSet) {
        store.dispatch(action: MessagesActions.RemoveMessage(messageId: offsets.first!))
    }
}

//struct MessagesHomeList_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagesHomeList()
//    }
//}
