//
//  ProductsActions.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation
import SwiftUIFlux

struct ProductsActions {

    // MARK: - Requests

    struct FetchProducts: AsyncAction {

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let products = [sampleProduct1, sampleProduct2, sampleProduct3, sampleProduct4, sampleProduct5, sampleProduct6]
            dispatch(SetProducts(list: products))
        }
    }

    struct FetchProductDetail: AsyncAction {
        let productId: Int

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let product = store.state.productsState.products[productId]
            dispatch(SetDetail(product: product))
        }
    }

    struct SetProducts: Action {
        let list: [Product]
    }

    struct SetDetail: Action {
        let product: Product
    }
}
