//
//  NotificationsHomeList.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct NotificationsHomeList: ConnectedView {

    struct Props {
        let notifications: [Notification]
        let notificationIds: [Int]
    }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(
            notifications: state.notificationsState.notifications.map { $0 },
            notificationIds: state.notificationsState.notifications.map { $0.id })
    }

    func body(props: Props) -> some View {
        List {
            Group {
                Section {
                    ForEach(props.notificationIds, id: \.self) { id in
                        NavigationLink(destination: ProductDetail(productId: props.notifications[id].product.id)) {
                            NotificationRow(notificationId: id)
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }

}

//struct NotificationsHomeList_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsHomeList()
//    }
//}
