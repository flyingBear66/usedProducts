//
//  ProductCell.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import SwiftUI
import SwiftUIFlux
import SDWebImageSwiftUI

struct ProductCell: ConnectedView {
    struct Props {
        let product: Product
    }

    // MARK: - Init
    let productId: Int
    let width: CGFloat

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        Props(product: state.productsState.products[productId]) // TODO: change with productId
    }

    func body(props: Props) -> some View {
        VStack(alignment: .leading) {
            WebImage(url: props.product.imageURL)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .frame(width: width, height: 100, alignment: .center)
            Group {
                Text(props.product.title)
                    .foregroundColor(.orange)
                    .lineLimit(1)

                Text("More information")
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text("Published Date: \(props.product.publishedDate.timeAgoDisplay)")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
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

//#if DEBUG
//struct ProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell()
//    }
//}
//#endif
