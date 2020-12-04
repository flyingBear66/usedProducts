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
            let products = [sampleProduct]
            dispatch(SetProducts(list: products))
        }
    }

    struct FetchProductDetail: AsyncAction {
        let productId: Int

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let product = sampleProduct
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
