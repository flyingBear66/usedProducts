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
        let list: [Product]
        let page: Int

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let products = [sampleProduct]
            dispatch(SetProducts(page: page + 1, list: products))
        }
    }

    struct SetProducts: Action {
        let page: Int
        let list: [Product]
    }
}
