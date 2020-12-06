//
//  TopProducts.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct TopProducts: ConnectedView {

    struct Props {
        let products: [Product]
    }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(products: state.productsState.products)
    }

    func body(props: Props) -> some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 8) {
                ForEach(props.products, id: \.self.id) { product in
                    ZStack(alignment: .bottomTrailing) {

                        ProductImage(product: product)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)

                        LikeButton(selected: product.isAdvertised)
                    }
                }
            }
        }
    }
}

//
//struct TopProducts_Previews: PreviewProvider {
//    static var previews: some View {
//        TopProducts()
//    }
//}
