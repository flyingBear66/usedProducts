//
//  NotificationRow.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import SwiftUI
import SwiftUIFlux
import SDWebImageSwiftUI

struct NotificationRow: ConnectedView {

    struct Props {
        let notification: Notification
    }

    // MARK: - Init
    let notificationId: Int

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        print(notificationId)
        return Props(notification: state.notificationsState.notifications[notificationId])
    }

    func body(props: Props) -> some View {
        HStack {

            ZStack(alignment: .bottomTrailing) {

                UserImage(user: props.notification.user)
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 10)

                LikedView(selected: true)
                    .frame(width: 30, height: 30)

            }.frame(width: 80, height: 70)

            VStack(alignment: .leading, spacing: 4) {

                Text(props.notification.title)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(props.notification.user.name)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Spacer()

                PrimaryButton(text: props.notification.action.text)
//
//                NavigationLink(destination: ProductDetail(productId: props.notification.product.id)) {
//
//                }
//                .buttonStyle(PlainButtonStyle())

                //                Button("Primary Action") {
                //                }
                //                .buttonStyle(PrimaryButtonStyle())
            }.padding(.leading, 8)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

//struct NotificationRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationRow()
//    }
//}
