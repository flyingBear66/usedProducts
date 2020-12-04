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

        state.products = action.list

    default:
        break
    }

    return state
}
