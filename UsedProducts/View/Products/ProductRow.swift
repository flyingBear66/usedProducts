//
//  ProductRow.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import SwiftUIFlux
import SDWebImageSwiftUI

struct ProductRow: ConnectedView {
    struct Props {
        let product: Product
    }

    // MARK: - Init
    let productId: Int

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(product: state.productsState.products[productId]) // TODO: change with productId
    }

    func body(props: Props) -> some View {
        HStack {
            WebImage(url: props.product.imageURL)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .frame(width: 100, height: 100, alignment: .center)

            VStack(alignment: .leading, spacing: 8) {
                Text(props.product.title)
                    .foregroundColor(.orange)
                    .lineLimit(2)
                HStack {
                    Text("Published Date: \(props.product.publishedDate.timeAgoDisplay)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
                Text("More information")
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }.padding(.leading, 8)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

private extension Product {
    var imageURL: URL? {
        URL(string: image + "/30\(id)/30\(id)")
    }
}
