//
//  MessageRow.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import SwiftUI
import SwiftUIFlux
import SDWebImageSwiftUI

struct MessageRow: ConnectedView {
    struct Props {
        let message: Message
    }

    // MARK: - Init
    let messageId: Int

    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "EUR"
        return formatter
    }()

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(message: state.messagesState.messages[messageId])
    }

    func body(props: Props) -> some View {
        HStack {

            ZStack(alignment: .bottomTrailing) {

                ProductImage(product: props.message.product)
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 15)

                UserImage(user: props.message.user)
                    .frame(width: 30, height: 30)

            }.frame(width: 85, height: 70)


            VStack(alignment: .leading, spacing: 4) {

                Text(props.message.user.name)
                    .foregroundColor(.orange)
                    .lineLimit(1)

                Text(props.message.text)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(formatter.string(from: NSNumber(value: props.message.product.price.amount)) ?? "N/a")
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)

            }.padding(.leading, 8)

            Spacer()

            Text(props.message.sentDate.timeAgoDisplay)
                .font(.subheadline)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}
