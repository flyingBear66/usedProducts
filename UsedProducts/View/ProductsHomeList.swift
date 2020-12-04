//
//  ProductsHomeList.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import Combine
import SwiftUIFlux

struct ProductsHomeList: ConnectedView {

    struct Props {
        let products: [Int]
    }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(products: state.productsState.products.map { $0.id })
    }

    func body(props: Props) -> some View {
        ProductsList(products: props.products)
            .navigationBarTitle("Product List Title")
    }
}
