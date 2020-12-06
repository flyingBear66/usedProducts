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

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(message: state.messagesState.messages[messageId]) // TODO: change with productId
    }

    func body(props: Props) -> some View {
        HStack {
            WebImage(url: props.message.ownerImage)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))

            VStack(alignment: .leading, spacing: 8) {
                Text(props.message.user.name)
                    .foregroundColor(.orange)
                    .lineLimit(1)
                HStack {
                    Text(props.message.sentDate.timeAgoDisplay)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
                Text(props.message.text)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }.padding(.leading, 8)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

private extension Message {
    var ownerImage: URL? {
        URL(string: user.image)
    }

    var productImage: URL? {
        URL(string: product.image)
    }
}
