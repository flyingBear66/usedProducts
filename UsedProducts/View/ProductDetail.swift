//
//  ProductDetail.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import SwiftUIFlux
import Combine

struct ProductDetail: ConnectedView {
    struct Props {
        let product: Product
    }

    let productId: Int

    // MARK: Computed Props
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(product: state.productsState.products[0])
    }

    // MARK: - Fetch
    func fetchProductDetails() {
        store.dispatch(action: ProductsActions.FetchProductDetail(productId: productId))
    }

    // MARK: - Body

    func body(props: Props) -> some View {
        ZStack(alignment: .bottom) {
            Text("Product Detail")
            .onAppear {
                self.fetchProductDetails()
            }
        }
    }
}
