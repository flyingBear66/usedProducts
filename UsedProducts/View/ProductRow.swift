//
//  ProductRow.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import SwiftUIFlux

struct ProductRow: ConnectedView {
    struct Props {
        let product: Product
    }

    // MARK: - Init
    let productId: Int
    var displayListImage = true

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(product: state.productsState.products[0]) // TODO: change with productId
    }

    func body(props: Props) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(props.movie.userTitle)
                    .titleStyle()
                    .foregroundColor(.steam_gold)
                    .lineLimit(2)
                HStack {
                    Text(formatter.string(from: props.movie.releaseDate ?? Date()))
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
                Text(props.movie.overview)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }.padding(.leading, 8)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}
