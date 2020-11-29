//
//  ProductsReducer.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation
import SwiftUIFlux

func productsStateReducer(state: ProductsState, action: Action) -> ProductsState {
    var state = state
    switch action {
    case let action as ProductsActions.SetProducts:

        if action.page == 1 {

            state.products = action.list
        } else {

            state.products.append(contentsOf: action.list)
        }

    default:
        break
    }

    return state
}
